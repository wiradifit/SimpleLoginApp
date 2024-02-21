//
//  UserInfoViewCell.swift
//  SimpleLoginApp
//
//  Created by Prawira Hadi Fitrajaya on 21/02/24.
//

import UIKit

class UserInfoViewCell: UITableViewCell {
    
    var avatarImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    var emailLabel = {
        let label = UILabel()
        label.textColor = .black
        
        return label
    }()
    
    var fullNameLabel = {
        let label = UILabel()
        label.textColor = .black
        
        return label
    }()
    
    func configureView(model: UserInfoModel){
        contentView.addSubview(avatarImageView)
        contentView.addSubview(emailLabel)
        contentView.addSubview(fullNameLabel)
        
        avatarImageView.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview().inset(10.0)
            make.size.equalTo(100.0)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(30.0)
            make.right.equalToSuperview().inset(10.0)
            make.left.equalTo(avatarImageView.snp.right).offset(4.0).priority(721)
        }
        
        fullNameLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(10.0)
            make.bottom.equalToSuperview().inset(30.0)
            make.left.equalTo(avatarImageView.snp.right).offset(4.0).priority(721)
        }
        
        if let url = URL(string: model.avatar) {
            avatarImageView.sd_setImage(with: url, placeholderImage: UIImage(systemName: "clock"))
        }
        
        emailLabel.text = model.email
        fullNameLabel.text = "\(model.firstName) \(model.lastName)"
    }
}
