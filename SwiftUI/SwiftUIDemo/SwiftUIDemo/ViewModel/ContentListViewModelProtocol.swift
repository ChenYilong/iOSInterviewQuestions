//
//  ContentListViewModelProtocol.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/3.
//

enum ViewState {
    case loading
    case loaded
    case error(string: String)
}

protocol ContentListViewModelProtocol {
    associatedtype Content
    associatedtype ContentCellViewModel: ContentCellViewModelProtocol where ContentCellViewModel.Content == Content
    var contents: Observable<[Content]> { get set }
    var contentCellViewModels: [ContentCellViewModel] { get set }
    var viewState: Observable<ViewState> { get }
    var searchText: Observable<String> { get }
    
    func contentCellViewModel(for content: Content) -> ContentCellViewModel
    func update() async throws
}

