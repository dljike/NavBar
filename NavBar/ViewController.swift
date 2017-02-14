//
//  ViewController.swift
//  NavBar
//
//  Created by 杜博 on 2017/2/13.
//  Copyright © 2017年 杜博. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    @IBOutlet var navView: NavBarView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = self.navView
        
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height

//        self.scrollView.frame = .init(x: 0, y: 0, width: width, height: height)
        self.scrollView.snp.makeConstraints { (make) in
            make.bottom.left.right.top.equalTo(self.view)
        }
        
        self.scrollView.contentSize = CGSize(width:width * 3, height:  0)
        self.scrollView.contentOffset = CGPoint(x:width, y: 0)
        
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let one = mainStoryboard.instantiateViewController(withIdentifier: "oneController")
        let two = mainStoryboard.instantiateViewController(withIdentifier: "twoController")
        let three = mainStoryboard.instantiateViewController(withIdentifier: "threeController")
        
        one.view.frame = .init(x: 0, y: 0, width: width, height: height - 64)
        two.view.frame = .init(x: width, y: 0, width: width, height: height - 64)
        three.view.frame = .init(x: width * 2, y: 0, width: width, height: height - 64)
        
        self.addChildViewController(one)
        self.addChildViewController(two)
        self.addChildViewController(three)
        
        self.scrollView.addSubview(one.view)
        self.scrollView.addSubview(two.view)
        self.scrollView.addSubview(three.view)
        

        
        
    }
    
    
     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

