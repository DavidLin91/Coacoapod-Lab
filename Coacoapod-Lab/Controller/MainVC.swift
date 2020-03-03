//
//  MainVC.swift
//  Coacoapod-Lab
//
//  Created by David Lin on 3/2/20.
//  Copyright © 2020 David Lin (Passion Proj). All rights reserved.
//

import UIKit
import Lottie
import SnapKit

class MainVC: UIViewController {

    private var launchView = LaunchView()
    private var userTabelView = RandomUserTableView()
    
    
    override func loadView() {
        view = userTabelView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTabelView.tableView.register(RandomUserCell.self, forCellReuseIdentifier: "TVC")
        view.backgroundColor = .white
        userTabelView.tableView.delegate = self
        userTabelView.tableView.dataSource = self
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

extension MainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TVC", for: indexPath) as? RandomUserCell else {
            fatalError()
            
        }
        // TODO:titleLabel.snp.makeConstraints { (make) in
        cell.backgroundColor = .white
        return cell
    }
    
    
}


extension MainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
