//
//  PostListViewModel.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/2.
//

import Foundation

final class PostListViewModel: ContentListViewModelProtocol {
    
    func contentCellViewModel(for post: Post) -> PostCellViewModel {
        let postCellViewModel = PostCellViewModel(content: post)
           return postCellViewModel
       }
//
    var contentCellViewModels: [PostCellViewModel] = Array()
    var contents = Observable<[Post]>(value: [])
    var allPosts: [Post] = []  // this would hold all your contents
    var viewState = Observable<ViewState>(value: .loading)
    var searchText = Observable<String>(value: "")
    
    private var repository: Repository
    
    init(repository: ApiRepository = ApiRepository()) {
        self.repository = repository
        setupSearchTextObserver()
    }
    
    func setupSearchTextObserver() {
        searchText.addObserver { [weak self] text in
            self?.filterContentForSearchText(text)
        }
    }
    
    func filterContentForSearchText(_ searchText: String) {
        guard !searchText.isEmpty else {
            self.resetFilters()
            return
        }
        
        let filteredPosts = allPosts.filter { (post: Post) -> Bool in
            return post.title.lowercased().contains(searchText.lowercased())
        }
        contents.value = filteredPosts
    }
    
    func resetFilters() {
        setupAllPosts()
    }
    
    func setupAllPosts() {
        contents.value = allPosts
    }
    
    func update() async throws {
        do {
            viewState.value = .loading
            let contents = try await repository.fetchPostList()
            if contents.isEmpty {
                self.viewState.value = .loading
            } else {
                self.viewState.value = .loaded
                self.allPosts = contents
                setupAllPosts()
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
