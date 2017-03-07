//
//  ShareManager.swift
//  NavBar
//
//  Created by 杜博 on 2017/2/27.
//  Copyright © 2017年 杜博. All rights reserved.
//

import UIKit

class ShareManager: NSObject {
    
    static let sharedInstance: ShareManager = {
        let instance = ShareManager()
        return instance
    }()
    
    
    
    
    func share() -> Void {
        let alert = UIAlertController(title: "Turn on Location Service", message: "To use location tracking feature of the app, please turn on the location service from the Settings app.", preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Settings", style: .destructive) { (_) -> Void in
            let settingsUrl = URL(string: UIApplicationOpenSettingsURLString)
            if let url = settingsUrl {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    // Fallback on earlier versions
                    UIApplication.shared.openURL(url)
                    
                }
            }
        }
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: nil)
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        
        let vc = UIViewController.topViewController()
        vc?.present(alert, animated: true, completion: nil)
    }
    
    
    

}
