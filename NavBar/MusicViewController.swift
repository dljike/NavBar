//
//  MusicViewController.swift
//  NavBar
//
//  Created by 杜博 on 2017/2/14.
//  Copyright © 2017年 杜博. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let banner = BannerView.init(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300), ImagesArr: ["img_01","img_02","img_03","img_04","img_05"])
        banner.Tapdeletage = { tag in
        print("---------\(tag)")
        
        }
        
        self.view.addSubview(banner)
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
