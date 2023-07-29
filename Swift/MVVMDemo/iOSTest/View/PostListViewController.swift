//
//  PostListViewController.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/2.
//

import UIKit

final class PostListViewController: BaseContentListViewController<Post, PostListViewModel<DefaultNetworking<PostRequest>>, PostCellViewModel> {

    required init(viewModel: PostListViewModel<DefaultNetworking<PostRequest>> = PostListViewModel()) {
        super.init(viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "iOS Test from ChenYilong"
        tableView.register(PostListTableViewCell.self)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.viewState.value {
            
        case .loading:
            return EmptyViewTableViewCell()
            
        case .loaded:
            let cell: PostListTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            let post = viewModel.contentCellViewModels[indexPath.item].content
            cell.configure(with: post)
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch viewModel.viewState.value {
            
        case .loading:
            return 1
            
        case .loaded:
            return viewModel.contentCellViewModels.count
            
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch viewModel.viewState.value {
            
        case .loading:
            return 60
            
        case .loaded:
            return 60
            
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        switch viewModel.viewState.value {
            
        case .loaded:
            let postViewModel = viewModel.contentCellViewModels[indexPath.item]
            postViewModel.cellPressed?()
            
        default:
            break
        }
    }
    
    override func cellPressed(content: Post) {
        navigationController?.pushViewController(PostDetailViewController(model: content), animated: true)
    }
    
}
