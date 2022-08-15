//
//  OrderListViewController.swift
//  iOSTest
//
//  Created by ChenYilong on 20/07/22.
//

import UIKit

class OrderListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let viewModel: ViewModel = ViewModel()
  
    lazy var loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        self.view.addSubview(indicator)
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        return indicator
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        
        view.addSubview(tableView)
        NSLayoutConstraint(item: tableView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view, attribute: .centerX,
                           multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: tableView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view, attribute: .leading,
                           multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: tableView,
                           attribute: .trailing,
                           relatedBy: .equal, toItem: view,
                           attribute: .trailing,
                           multiplier: 1.0,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: tableView, attribute: .top,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .top,
                           multiplier: 1.0,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: tableView,
                           attribute: .bottom,
                           relatedBy: .equal, toItem: view,
                           attribute: .bottom,
                           multiplier: 1.0,
                           constant: 0).isActive = true
        
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        
        //TODO:-  tableView.backgroundColor = Custom color of your choice
        tableView.backgroundColor = UIColor.white;
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        initBinding()
    }
    
    func initView() {
        //TODO:-  view.backgroundColor = Custom color of your choice
        view.backgroundColor = UIColor.white;
        self.title = "YILONG CHEN's Demo";
        let orderListCell = UINib(nibName: "OrderListCell",
                                      bundle: nil)
        self.tableView.register(orderListCell, forCellReuseIdentifier: "Cell");

    }
    
    func initBinding() {
        viewModel.orders.addObserver(fireNow: true) { [weak self] (orders) in
            let sortedOrders = orders.sorted { $0.id < $1.id };
            for order in sortedOrders {
                let orderListCellViewModel = OrderListCellViewModel(order: order);
                orderListCellViewModel.cellPressed = {
                    self?.cellPressed(order: order);
                }
                self?.viewModel.orderListCellViewModels.append(orderListCellViewModel);
            }
            self?.tableView.reloadData()
        }
    }
    
    
    // MARK: - UITableViewDataSource, UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.orderListCellViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? OrderListCell {
            let orderListCellViewModel = self.viewModel.orderListCellViewModels[indexPath.row];
            cell.cellViewModel = orderListCellViewModel;
            print("order.descriptionString();", orderListCellViewModel.order.descriptionString());

            return cell;
        }
        
        let cell = UITableViewCell();
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let orderListCellViewModel = self.viewModel.orderListCellViewModels[indexPath.row];
        orderListCellViewModel.cellPressed?();
        
    }
    
    func cellPressed(order: Order) {
        let detailOrderViewController = ViewController();
        let productsList = order.products;
        detailOrderViewController.viewModel.productsList = productsList;
        detailOrderViewController.view.backgroundColor = UIColor.white;
        detailOrderViewController.title = order.descriptionString();
        self.navigationController?.pushViewController(detailOrderViewController, animated: true);
    }
}

