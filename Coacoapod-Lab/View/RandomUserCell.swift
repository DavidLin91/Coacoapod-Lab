//
//  RandomUserCell.swift
//  Coacoapod-Lab
//
//  Created by David Lin on 3/2/20.
//  Copyright © 2020 David Lin (Passion Proj). All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class RandomUserCell: UITableViewCell {
    
    public lazy var userProfileImage : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray3
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        return imageView
    }()
    
    public lazy var userNameLabel : UILabel = {
        let label = UILabel()
        label.text = "Person Name"
        label.textColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        label.font = label.font.withSize(20)
        label.textAlignment = .left
        return label
    }()
    
    public lazy var locationLabel : UILabel = {
        let label = UILabel()
        label.text = "Person Address"
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        commonInit()
    }
    
    
    private func commonInit() {
        configureUserProfImg()
        configureUserName()
        configureLocationlabel()
    }
    
    
    func configureCell(user: User) {
        userNameLabel.text = "\(user.name.first) \(user.name.last)"
        locationLabel.text = "\(user.location.state) \(user.location.city)"
        guard let imageURL = URL(string: user.picture.medium) else {
            return
        }
        userProfileImage.kf.setImage(with: imageURL)
    }
    
    
    private func configureUserProfImg() {
        addSubview(userProfileImage)
        userProfileImage.snp.makeConstraints { (make) in
            make.leading.top.bottom.equalTo(safeAreaLayoutGuide).offset(0)
            make.width.equalTo(100)
        }
    }
    
    private func configureUserName() {
        addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(safeAreaLayoutGuide).offset(0)
            make.top.equalTo(safeAreaLayoutGuide).offset(10)
            make.leading.equalTo(userProfileImage.snp.trailing).offset(10)
            
        }
    }
    
    private func configureLocationlabel() {
        addSubview(locationLabel)
        locationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(userNameLabel.snp.bottom).offset(10)
            make.trailing.equalTo(safeAreaLayoutGuide)
            make.leading.equalTo(userProfileImage.snp.trailing).offset(10)
        }
    }
    
    
}
