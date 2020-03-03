//
//  LaunchView.swift
//  Coacoapod-Lab
//
//  Created by David Lin on 3/2/20.
//  Copyright © 2020 David Lin (Passion Proj). All rights reserved.
//

import UIKit
import Lottie
import SnapKit

class LaunchView: UIView {
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.text = "HAVE NOTHING TO DO?"
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(30)
        return label
    }()
    
    private lazy var subTitle: UILabel = {
       let label = UILabel()
        label.text = "FIND SOME RANDOM PEOPLE"
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(18)
        return label
    }()
    
    private lazy var launchView: Lottie.AnimationView = {
        let lottieAnimationView = Lottie.AnimationView()
        lottieAnimationView.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        return lottieAnimationView
    }()
    
    
    public func startAnimation() {
        launchView.animation = Animation.named("launchAnimation", subdirectory: nil)
        launchView.play()
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        commonInit()
    }
    
    
    private func commonInit() {
        animationViewConstraint()
        setupTitleConstraint()
        setupSubtitleConstraint()
    }
    
    private func animationViewConstraint() {
        addSubview(launchView)
        launchView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            launchView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -100),
            launchView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            launchView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            launchView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 100)
        ])
    }
    
    private func setupTitleConstraint() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            
        }
    }
    
    private func setupSubtitleConstraint() {
        addSubview(subTitle)
        subTitle.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-100)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            
        }
    }
    
    
    
}
