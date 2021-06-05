//
//  ListCell.swift
//  Movies
//
//  Created by Pavlo Bondar on 05.06.2021.
//

import UIKit
import SnapKit

class ListCell: UITableViewCell {
    static let identifier: String = "listCell"

    var poster: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(systemName: "command.square.fill")
        imageView.tintColor = .black
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return title
    }()
    
    var descriptionLabel: UILabel = {
        let description = UILabel()
        description.font = UIFont.systemFont(ofSize: 14)
        description.numberOfLines = 3
        description.textColor = .lightGray
        return description
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configure()
        self.selectionStyle = .none
    }
    
    func configure() {
        self.contentView.addSubview(poster)
        poster.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 100, height: 100))
            $0.left.equalToSuperview().offset(10)
            $0.top.equalToSuperview().offset(5)
            $0.bottom.equalToSuperview().offset(-5)
        }
        
        self.contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(poster.snp.right).offset(20)
            $0.right.equalToSuperview().offset(-10)
            $0.top.equalToSuperview().offset(10)
        }
        
        self.contentView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints {
            $0.left.equalTo(poster.snp.right).offset(20)
            $0.right.equalToSuperview().offset(-10)
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.bottom.equalToSuperview().offset(-5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
