//
//  MainVC.swift
//  Coacoapod-Lab
//
//  Created by David Lin on 3/2/20.
//  Copyright © 2020 David Lin (Passion Proj). All rights reserved.
//

import UIKit
import Lottie

class MainVC: UIViewController {

    private var launchView = LaunchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.runLottieAnimation()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.removeAnimationScreen()
        }
    }
    
    func runLottieAnimation() {
        view.addSubview(launchView)
        launchView.startAnimation()
    }
    
    func removeAnimationScreen() {
        launchView.removeFromSuperview()
    }
    
    
}
