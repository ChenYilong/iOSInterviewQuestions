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
    
    var post: Post
    
    private var contentCellViewModels: [CommentCellViewModel] = Array()
    
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
    
    func contentCellViewModel(for content: Comment) -> CommentCellViewModel {
        let commentCellViewModel = CommentCellViewModel(content: content)
        return commentCellViewModel
    }
    
    func searchTextChanged(_ searchTextValue: String) {
        searchText.value = searchTextValue
    }
    
    func contentsFetched(_ theContentCellViewModels: [CommentCellViewModel]) {
        contentCellViewModels = theContentCellViewModels
    }
    
    private func contentCellViewModel(at index: Int) -> CommentCellViewModel {
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
