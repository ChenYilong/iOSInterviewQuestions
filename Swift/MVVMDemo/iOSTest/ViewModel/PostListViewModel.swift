//
//  PostListViewModel.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/2.
//

import Foundation

final class PostListViewModel<N: Networking>: ContentListViewModelProtocol where N.R == PostRequest {
    typealias Content = Post

    private var contentCellViewModels: [PostCellViewModel] = Array()
    var posts: Posts<N>
    
    var contents: Observable<[Content]> {
        posts.entity
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
            self?.posts.filterEntityForSearchText(text)
        }
    }
    
    func setupAllPosts() {
        posts.setupAllContents()
    }
    
    func refreshTriggered() async {
        do {
            viewState.value = .loading
            try await self.posts.loadEntity()
            let contents = self.posts.originalContents
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
    
    func contentCellViewModel(for post: Content) -> PostCellViewModel {
        let postCellViewModel = PostCellViewModel(content: post)
        return postCellViewModel
    }
    
    private func contentCellViewModel(at index: Int) -> PostCellViewModel {
        let contentViewModel = contentCellViewModels[index]
        return contentViewModel
    }
    
    func numberOfRowsInSection() -> Int {
        switch viewState.value {
            
        case .loading:
            return 1
            
        case .loaded:
            return contentCellViewModels.count
            
        default:
            return 0
        }
    }
    
    func contentForRowAt(at index: Int) -> Content {
        contentCellViewModels[index].content
    }
    
    func didSelectRowAt(at index: Int) {
        switch viewState.value {
            
        case .loaded:
            let postViewModel = contentCellViewModel(at: index)
            postViewModel.cellPressed?()
            
        default:
            break
        }
    }
}
