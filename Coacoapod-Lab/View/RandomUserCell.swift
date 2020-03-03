//
//  RandomUserCell.swift
//  Coacoapod-Lab
//
//  Created by David Lin on 3/2/20.
//  Copyright © 2020 David Lin (Passion Proj). All rights reserved.
//

import UIKit
import SnapKit

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
      label.text = "Venue Name"
      label.font = label.font.withSize(20)
      label.textAlignment = .left
      return label
    }()
    
    public lazy var locationLabel : UILabel = {
      let label = UILabel()
      label.text = "Venue Address"
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
        configureUserProfImg()
        configureUserName()
        configureLocationlabel()
    }
    
    
    private func commonInit() {
        configureUserProfImg()
        configureUserName()
        configureLocationlabel()
    }
    
    
    private func configureUserProfImg() {
        addSubview(userProfileImage)
        userProfileImage.snp.makeConstraints { (make) in
            make.leading.equalTo(safeAreaLayoutGuide)
            make.height.width.equalTo(50)
        }
    }
    
    private func configureUserName() {
        addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { (make) in
        }
    }
    
    private func configureLocationlabel() {
        addSubview(locationLabel)
        locationLabel.snp.makeConstraints { (make) in
        }
    }
    
    
}
