//
//  DataController.swift
//  coding_challenge_swift
//
//  Created by Gaston Martin on 11/8/16.
//  Copyright © 2016 gaston. All rights reserved.
//


import Foundation
import UIKit
import SwiftyJSON
import Alamofire

final class WebService {

    // requests user info from url
    func getUserData(completionHandler: @escaping (JSON) -> Void){
        
        Alamofire.request(userURL).responseJSON { (data) in
            guard let response = data.result.value else {return}
            let userData = JSON(response)
            completionHandler(userData)
        }
        
    }

    
    
    
}



