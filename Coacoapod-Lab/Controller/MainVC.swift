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
    
    private var allUsers = [User]() {
        didSet {
            DispatchQueue.main.async {
                self.userTabelView.tableView.reloadData()
            }
        }
    }
    
    
    override func loadView() {
        view = userTabelView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTabelView.tableView.register(RandomUserCell.self, forCellReuseIdentifier: "TVC")
        view.backgroundColor = .white
        userTabelView.tableView.delegate = self
        userTabelView.tableView.dataSource = self
        getUsers()
    }
    
    private func getUsers() {
        RandomUserAPIClient.fetchRandomUser { (result) in
            switch result {
            case .failure(let error):
                print("oops no cocktail for you \(error)")
            case .success(let users):
                DispatchQueue.main.async {
                    self.allUsers = users
                }
            }
        }
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
        return allUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TVC", for: indexPath) as? RandomUserCell else {
            fatalError()
            
        }
        cell.backgroundColor = .white
        let user = allUsers[indexPath.row]
        cell.configureCell(user: user)
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = allUsers[indexPath.row]
        let detailVC = DetailVC(user: user)
        present(detailVC, animated: true)
        
    }
}


extension MainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    
    
    
}
