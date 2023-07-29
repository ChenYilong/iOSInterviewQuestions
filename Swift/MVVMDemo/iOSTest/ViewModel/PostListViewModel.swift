//
//  PostListViewModel.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/2.
//

import Foundation

final class PostListViewModel<N: Networking>: ContentListViewModelProtocol where N.R == PostRequest {

    func contentCellViewModel(for post: Post) -> PostCellViewModel {
        let postCellViewModel = PostCellViewModel(content: post)
        return postCellViewModel
    }
    
    var contentCellViewModels: [PostCellViewModel] = Array()
    var posts: Posts<N>
    
    var contents: Observable<[Post]> {
        return posts.contents
    }
    
    var viewState = Observable<ViewState>(value: .loading)
    var searchText = Observable<String>(value: "")
    
    private var networking: N
    
    init(networking: N = DefaultNetworking()) {
        self.networking = networking
        self.posts = Posts(networking: networking)
        setupSearchTextObserver()
    }
    
    func setupSearchTextObserver() {
        searchText.addObserver { [weak self] text in
            self?.posts.filterContentForSearchText(text)
        }
    }
    
    func setupAllPosts() {
        posts.setupAllContents()
    }
    
    func refreshTriggered() async {
        do {
            viewState.value = .loading
            try await self.posts.loadEntity()
            let contents = self.posts.allPosts
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
    
    func contentsFetched(_ theContentCellViewModels: [PostCellViewModel]) {
        contentCellViewModels = theContentCellViewModels
    }
    
}
