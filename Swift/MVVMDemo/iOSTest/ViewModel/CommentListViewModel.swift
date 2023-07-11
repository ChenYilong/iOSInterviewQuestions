//
//  PostListViewModel.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/2.
//

import Foundation

final class CommentListViewModel: ContentListViewModelProtocol {
    
    typealias Content = Comment
    
    typealias ContentCellViewModel = CommentCellViewModel
    
    func contentCellViewModel(for content: Comment) -> CommentCellViewModel {
        let commentCellViewModel = CommentCellViewModel(content: content)
        return commentCellViewModel
    }
    
    var postId : Int
    var contentCellViewModels: [CommentCellViewModel] = Array()
    var contents: Observable<[Content]> = Observable<[Comment]>(value: [])
    var allComments: [Comment] = []  // this would hold all your contents
    var viewState = Observable<ViewState>(value: .loading)
    var searchText = Observable<String>(value: "")
    
    func setupSearchTextObserver() {
        searchText.addObserver { [weak self] text in
            self?.filterContentForSearchText(text)
        }
    }
    
    func filterContentForSearchText(_ searchText: String) {
        if searchText.isEmpty {
            self.resetFilters()
            return
        }
        let filteredcontents = allComments.filter { (comment: Comment) -> Bool in
            return comment.body.lowercased().contains(searchText.lowercased())
        }
        contents.value = filteredcontents
    }
    
    func resetFilters() {
        setupAllcontents()
    }
    
    func setupAllcontents() {
        contents.value = allComments
    }
        
    private var repository: Repository
    
    init(postId: Int, repository: ApiRepository = ApiRepository()) {
        self.postId = postId
        self.repository = repository
        setupSearchTextObserver()
    }
    
    func update() async throws {
        do {
            let contents = try await repository.fetchComments(id: postId)
            if contents.isEmpty {
                self.viewState.value = .loading
            } else {
                self.viewState.value = .loaded
                self.allComments = contents
                setupAllcontents()
            }
        } catch {
            // handle error
            self.viewState.value = .error(string: error.localizedDescription)
            throw error
        }
    }

    
    deinit {
        contents.removeObserver()
        viewState.removeObserver()
    }
}
