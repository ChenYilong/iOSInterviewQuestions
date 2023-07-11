//
//  ViewController.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/2.
//

import UIKit

final class CommentListViewController: BaseContentListViewController<Comment, CommentListViewModel, CommentCellViewModel> {
    
    required init(viewModel: CommentListViewModel) {
        super.init(viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Comments"
        tableView.register(CommentListTableViewCell.self, forCellReuseIdentifier: CommentListTableViewCell.reuseIdentifier)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.viewState.value {
            
        case .loading:
            return EmptyViewTableViewCell()
            
        case .loaded:
            let cell = tableView.dequeueReusableCell(withIdentifier: CommentListTableViewCell.reuseIdentifier, for: indexPath) as! CommentListTableViewCell
            let comment = viewModel.contentCellViewModels[indexPath.item].content
            cell.configure(with: comment)
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
            return 240
            
        case .loaded:
            return 240
            
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
    
    override func cellPressed(content: Comment) {
        navigationController?.pushViewController(CommentDetailViewController(model: content), animated: true)
    }
    
}

