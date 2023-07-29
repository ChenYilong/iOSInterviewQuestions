//
//  PostDetailViewController.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/2.
//


import UIKit

class BaseContentDetailViewController<Model: ContentModel>: UIViewController {
    
    let model: Model
    
    init(model: Model) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.largeTitleDisplayMode = .never
        
        title = model.title

        setupView()
    }
    
    // Normally I wouldn't set up a view like this but since this is only just 1 view for this test, so i'm sorry
    private func setupView() {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        let contentLabel = UITextView()
        contentLabel.isEditable = false
        contentLabel.font = .systemFont(ofSize: 18, weight: .regular)
        contentLabel.text = model.body
        contentLabel.contentOffset = .zero
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(contentLabel)

        view.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            
            contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            contentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -48),
            contentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40)
        ])
    }
    
}
