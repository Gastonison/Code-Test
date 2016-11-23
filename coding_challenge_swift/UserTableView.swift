//
//  UserTableView.swift
//  coding_challenge_swift
//
//  Created by Gaston Martin on 11/8/16.
//  Copyright © 2016 gaston. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import Kingfisher

class UserTableView: UITableView {

    var userDataJson:JSON?
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.dataSource = self
        self.delegate = self
        self.backgroundColor = secondaryColor
        self.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension UserTableView: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId")
        
        // Checks that user exists otherwise returns empty cell
        guard let userData = userDataJson?["users"].arrayValue[indexPath.row] else {return cell!}
        let userName = userData["name"].stringValue
        let userImage = userData["thumbnail"].stringValue
        cell?.selectionStyle = .none
        
        
        // Stores and displays image using Kingfisher - Uses placeholder image while downloading
        let url = URL(string: userImage)
        let placeholder = UIImage(named: "placeholder.png")
        cell?.imageView?.kf.setImage(with: url, placeholder: placeholder, options: [.transition(.fade(1))], progressBlock: nil, completionHandler: nil)

        // Animates Image
        cell?.imageView?.alpha = 0
        UIView.animate(withDuration: 0.3) {
            cell?.imageView?.alpha = 1
        }
        
        
        cell?.textLabel?.text = userName
        cell?.textLabel?.font = UIFont(name: "Avenir", size: 16)
        cell?.backgroundColor = secondaryColor
        cell?.textLabel?.textColor = primaryColor
        
        return cell!
    }
    
    // sets number of cells to number of users
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = userDataJson?["users"].array?.count else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
