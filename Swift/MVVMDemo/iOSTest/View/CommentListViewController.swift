//
//  ViewController.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/2.
//

import UIKit

final class CommentListViewController: BaseContentListViewController<Comment, CommentListViewModel<DefaultNetworking<CommentRequest>>, CommentCellViewModel> {

    required init(viewModel: CommentListViewModel<DefaultNetworking<CommentRequest>>) {
        super.init(viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Comments"
        tableView.register(CommentListTableViewCell.self)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.viewState.value {
            
        case .loading:
            return EmptyViewTableViewCell()
            
        case .loaded:
            let cell: CommentListTableViewCell = tableView.dequeueReusableCell(for: indexPath)

            let comment = viewModel.contentForRowAt(at: indexPath.item)
            cell.configure(with: comment)
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection()
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
        viewModel.didSelectRowAt(at: indexPath.item)
    }
    
    override func cellPressed(content: Comment) {
        navigationController?.pushViewController(CommentDetailViewController(model: content), animated: true)
    }
    
}

