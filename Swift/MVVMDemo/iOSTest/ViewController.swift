//
//  ViewController.swift
//  iOSTest
//
//  Created by ChenYilong on 10/11/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
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
        let orderCell = UINib(nibName: "OrderCell",
                                      bundle: nil)
        self.tableView.register(orderCell, forCellReuseIdentifier: "Cell");

    }
    
    func initBinding() {
        viewModel.orders.addObserver(fireNow: false) { [weak self] (orders) in
            self?.tableView.reloadData()
        }
    }
    
    // MARK: - UITableViewDataSource, UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.productsList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? OrderCell {
            let product = self.viewModel.productsList[indexPath.row];
            let orderCellViewModel = OrderCellViewModel(product: product);
            cell.cellViewModel = orderCellViewModel;
            return cell;
        }
        
        let cell = UITableViewCell();
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let detailOrderViewController = UIViewController();
        detailOrderViewController.view.backgroundColor = UIColor.white;
        detailOrderViewController.title = "detailOrderViewController";
        self.navigationController?.pushViewController(detailOrderViewController, animated: true);
    }
    
}

