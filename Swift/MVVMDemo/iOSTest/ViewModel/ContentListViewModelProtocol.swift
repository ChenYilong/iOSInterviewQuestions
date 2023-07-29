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

    func numberOfRowsInSection() -> Int
    func contentForRowAt(at index: Int) -> Content
    func didSelectRowAt(at index: Int)

    // MARK: sub View Model
    func contentCellViewModel(for content: Content) -> ContentCellViewModel
    
}
