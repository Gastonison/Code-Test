//
//  LoadingViewController.swift
//  coding_challenge_swift
//
//  Created by Gaston Martin on 11/8/16.
//  Copyright © 2016 gaston. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView
import SnapKit

class LoadingView: UIView {
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = frame
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//  Displays download indicator - Uses SnapKit as a programatic autolayout wrapper
    func setupViews() {
        
        self.backgroundColor = secondaryColor
        let indicatorFrame = CGRect(x: 0, y: 0, width: 40, height: 40)
        let indicator = NVActivityIndicatorView(frame: indicatorFrame, type: NVActivityIndicatorType.init(rawValue: 19), color: primaryColor, padding: 2)
        self.addSubview(indicator)
        indicator.snp.makeConstraints { (make) in
            make.center.equalTo(self.snp.center)
        }
        indicator.startAnimating()

    }
    
    func fadeView() {
        
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseIn, animations: {
            self.alpha = 0
            }) { (Bool) in
                self.removeFromSuperview()
        }
        
    }
    
}
