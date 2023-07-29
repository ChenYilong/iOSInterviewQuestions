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
    
    // MARK: Data bingding
    var contents: Observable<[Content]> { get }
    
    
    // MARK: View State
    var viewState: Observable<ViewState> { get }

    // MARK: commands
    func refreshTriggered() async
    func searchTextChanged(_ searchText: String)
    func contentsFetched(_ contentCellViewModels: [ContentCellViewModel])
    
    // MARK: sub View Model
    var contentCellViewModels: [ContentCellViewModel] { get }
    func contentCellViewModel(for content: Content) -> ContentCellViewModel
}
