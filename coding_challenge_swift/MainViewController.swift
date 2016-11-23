//
//  MainViewController.swift
//  coding_challenge_swift
//
//  Created by Gaston Martin on 11/8/16.
//  Copyright © 2016 gaston. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
//  Displays loading screen, intializes tableview, sends tableview data once retrieved
    func setupViews() {
        
        self.view.backgroundColor = secondaryColor
        let loadingView = LoadingView(frame: self.view.frame)
        let tableViewFrame = CGRect(x: 0, y: 30, width: self.view.frame.width, height: self.view.frame.height-30)
        let userTableView = UserTableView(frame: tableViewFrame, style: .plain)
        self.view.addSubview(userTableView)
        self.view.addSubview(loadingView)
        
        WebService().getUserData { (data) in
            print(data)
            userTableView.userDataJson = data
            userTableView.reloadData()
            loadingView.fadeView()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

