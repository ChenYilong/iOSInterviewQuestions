//
//  PostListViewController.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/2.
//

import UIKit

protocol ContentHandling {
    associatedtype Content
    func cellPressed(content: Content)
}

class BaseContentListViewController<Content, ViewModelType: ContentListViewModelProtocol, ContentCellViewModel>: UITableViewController, UISearchResultsUpdating, ContentHandling where ViewModelType.Content == Content {
    
    lazy var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.obscuresBackgroundDuringPresentation = false
        controller.searchBar.placeholder = "Search"
        controller.searchResultsUpdater = self
        controller.hidesNavigationBarDuringPresentation = false
        controller.searchBar.searchBarStyle = .minimal
        return controller
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        return indicator
    }()
    
    var updateTask: Task<Void, Error>? = nil
    
    var viewModel: ViewModelType
    
    required init(viewModel: ViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(appDidEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appWillEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        refreshControl = UIRefreshControl()
        refreshControl?.backgroundColor = .refreshControlBgColor
        refreshControl?.addTarget(self, action: #selector(refreshTriggered), for: .valueChanged)
        
        // Setup the Search Controller
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
        
        tableView.register(EmptyViewTableViewCell.self)

        refreshTriggered()
        self.view.addSubview(activityIndicator)
        // Set up constraints
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc
    private func refreshTriggered() {
        refreshControl?.beginRefreshing()
        navigationController?.setNavigationBarHidden(false, animated: true)
        initBinding()
    }
    
    func initBinding() {
        updateTask = Task { [weak self] in
            await viewModel.refreshTriggered()
            viewModel.contents.addObserver(fireNow: true) { [weak self] contents in
                var contentCellViewModels: [ViewModelType.ContentCellViewModel] = []
                for content in contents {
                    if Task.isCancelled {
                        self?.updateTask = nil
                        break
                    }
                    if var homeContentCellViewModel = self?.viewModel.contentCellViewModel(for: content) {
                        homeContentCellViewModel.cellPressed = {
                            self?.cellPressed(content: content)
                        }
                        contentCellViewModels.append(homeContentCellViewModel)
                    }
                }
                
                self?.viewModel.contentsFetched(contentCellViewModels)
                
                await MainActor.run {
                    self?.tableView.reloadData()
                    self?.refreshControl?.endRefreshing()
                }
            }
            
            viewModel.viewState.addObserver(fireNow: true) { [weak self] viewState in
                switch viewState {
                    
                case .loading:
                    self?.activityIndicator.startAnimating()
                    break
                    
                case .loaded, .error:
                    self?.activityIndicator.stopAnimating()
                    // Update your view to reflect the error state, using the provided error message
                    break
                    
                }
            }
        }
    }
    
    open func cellPressed(content: Content) {
        // This function can be overridden in each subclass to handle specific actions
    }
    
    // MARK: UISearchResultsUpdating
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.searchTextChanged(searchController.searchBar.text ?? "")
    }
    
    // MARK: update task life cycle
    deinit {
        updateTask?.cancel()
        updateTask = nil
    }
    
    @objc func appDidEnterBackground() {
        updateTask?.cancel()
        updateTask = nil
    }
    
    @objc func appWillEnterForeground() {
        initBinding()
    }
}
