//
//  PostDetailViewController.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/2.
//

import UIKit

final class PostDetailViewController: BaseContentDetailViewController<Post> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCommentsButton()
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
        
        addCommentsButton()
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            
            contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            contentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -48),
            contentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
        ])
    }
    
    func addCommentsButton() {
        let contentsButton = UIButton()
        contentsButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(contentsButton)
        
        contentsButton.translatesAutoresizingMaskIntoConstraints = false
        
        let attributedString = NSMutableAttributedString.init(string: "Comments")
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range:
                                        NSRange.init(location: 0, length: attributedString.length))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range:
                                        NSRange.init(location: 0, length: attributedString.length))
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 24.0), range: NSRange.init(location: 0, length: attributedString.length))
        contentsButton.setAttributedTitle(attributedString, for: .normal)
        
        NSLayoutConstraint.activate([
            contentsButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            contentsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentsButton.topAnchor.constraint(equalTo: view.topAnchor),
            contentsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        contentsButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        navigationController?.pushViewController(CommentListViewController(viewModel: CommentListViewModel(post: model)), animated: true)
    }
}
