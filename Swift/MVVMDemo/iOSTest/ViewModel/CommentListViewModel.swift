//
//  PostListViewModel.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/2.
//

import Foundation

final class CommentListViewModel<N: Networking>: ContentListViewModelProtocol where N.R == CommentRequest {
    
    typealias Content = Comment
    
    typealias ContentCellViewModel = CommentCellViewModel
    
    func contentCellViewModel(for content: Comment) -> CommentCellViewModel {
        let commentCellViewModel = CommentCellViewModel(content: content)
        return commentCellViewModel
    }
    
    var post: Post
    
    var contentCellViewModels: [CommentCellViewModel] = Array()
    
    var viewState = Observable<ViewState>(value: .loading)
    
    var comments: Comments<N>
    
    var contents: Observable<[Comment]> {
        comments.entity
    }
    
    var searchText = Observable<String>(value: "")
    
    func setupSearchTextObserver() {
        searchText.addObserver { [weak self] text in
            self?.comments.filterEntityForSearchText(text)
        }
    }
        
    private var networking: N
    
    init(post: Post, networking: N = DefaultNetworking<CommentRequest>()) {
        self.post = post
        self.networking = networking
        self.comments = Comments(post: post, networking: networking)
        setupSearchTextObserver()
    }
    
    func refreshTriggered() async {
        do {
            try await comments.loadEntity()
            let contents = comments.originalContents
            if contents.isEmpty {
                self.viewState.value = .loading
            } else {
                self.viewState.value = .loaded
            }
        } catch {
            // handle error
            self.viewState.value = .error(string: error.localizedDescription)
        }
    }
    
    deinit {
        viewState.removeObserver()
    }

    // MARK: ContentListViewModelProtocol
    func searchTextChanged(_ searchTextValue: String) {
        searchText.value = searchTextValue
    }
    
    func contentsFetched(_ theContentCellViewModels: [CommentCellViewModel]) {
        contentCellViewModels = theContentCellViewModels
    }
    
}
