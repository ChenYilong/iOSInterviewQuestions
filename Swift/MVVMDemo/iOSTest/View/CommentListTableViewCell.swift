//
//  CommentListTableViewCell.swift
//  iOSTest
//
//  Created by chenyilong on 2023/7/3.
//

import UIKit

final class CommentListTableViewCell: UITableViewCell {
    
    private let userIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let postIdLabel = UILabel()
    private let nameLabel = UILabel()
    private let bodyLabel = UILabel()
    private let idLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with comment: Comment) {
        userIconImageView.image = UIImage(named: "userIconPlaceholder")
        postIdLabel.text = "PostId: \(comment.postId)"
        
        nameLabel.text =  "Name: " + comment.name
        bodyLabel.text = "Comment: " + comment.body
        idLabel.text = "ID: \(comment.id)"
    }
    
    private func commonInit() {
        postIdLabel.font = .systemFont(ofSize: 18, weight: .regular)
        postIdLabel.numberOfLines = 0
        nameLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        nameLabel.numberOfLines = 0
        bodyLabel.font = .systemFont(ofSize: 18, weight: .regular)
        bodyLabel.numberOfLines = 0
        idLabel.font = .systemFont(ofSize: 16, weight: .regular)
        idLabel.numberOfLines = 0
        // quantityLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        let labelStackView = UIStackView()
        labelStackView.axis = .vertical
        labelStackView.spacing = 4
        
        labelStackView.addArrangedSubview(postIdLabel)
        labelStackView.addArrangedSubview(nameLabel)
        labelStackView.addArrangedSubview(bodyLabel)
        labelStackView.addArrangedSubview(idLabel)
        
        let containerStackView = UIStackView()
        containerStackView.axis = .horizontal
        containerStackView.spacing = 16
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        containerStackView.addArrangedSubview(userIconImageView)
        containerStackView.addArrangedSubview(labelStackView)
        
        contentView.addSubview(containerStackView)
        
        NSLayoutConstraint.activate([
            userIconImageView.widthAnchor.constraint(equalToConstant: 80),
            
            containerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
