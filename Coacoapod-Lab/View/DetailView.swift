//
//  DetailView.swift
//  Coacoapod-Lab
//
//  Created by David Lin on 3/3/20.
//  Copyright © 2020 David Lin (Passion Proj). All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class DetailView: UIView {
    
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
        label.textAlignment = .center
        return label
    }()
    
    public lazy var locationLabel : UILabel = {
        let label = UILabel()
        label.text = "Person Address"
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
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
    

    
    
    
    private func configureUserProfImg() {
        addSubview(userProfileImage)
        userProfileImage.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide).offset(40)
            make.height.width.equalTo(200)
            make.centerX.equalTo(safeAreaLayoutGuide.self)
        }
    }
    
    private func configureUserName() {
        addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(userProfileImage.snp.bottom).offset(20)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).offset(20)
        }
    }
    
    private func configureLocationlabel() {
        addSubview(locationLabel)
        locationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(userNameLabel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).offset(20)
        }
    }
    
    
    
    
}
