//
//  DetailVC.swift
//  Coacoapod-Lab
//
//  Created by David Lin on 3/3/20.
//  Copyright © 2020 David Lin (Passion Proj). All rights reserved.
//

import UIKit
import Kingfisher

class DetailVC: UIViewController {

    let detailView = DetailView()
    private let user: User
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
           view = detailView
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.backgroundColor = .white
        update(user: user)
    }

    private func update(user: User) {
        detailView.userNameLabel.text = "\(user.name.first) \(user.name.last)"
        detailView.locationLabel.text = "\(user.location.state) \(user.location.city)"
        guard let imageURL = URL(string: user.picture.medium) else {
            return
        }
        detailView.userProfileImage.kf.setImage(with: imageURL)
    }
    
    
    

}
