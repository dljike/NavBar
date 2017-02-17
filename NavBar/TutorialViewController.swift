//
//  TutorialViewController.swift
//  UIPageViewController Post
//
//  Created by Jeffrey Burt on 2/3/16.
//  Copyright © 2016 Seven Even. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {
    
    @IBOutlet weak var threebtn: UIButton!
    @IBOutlet weak var twobtn: UIButton!
    @IBOutlet weak var onebtn: UIButton!
    @IBOutlet var navView: UIView!
    
    var tutorialPageViewController: TutorialPageViewController? {
        didSet {
            tutorialPageViewController?.tutorialDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = self.navView
    }
    
    func changNavColor(index:Int) -> Void {
        if index == 0 {
            self.onebtn.backgroundColor = UIColor.clear
            self.twobtn.backgroundColor = UIColor.red
            self.threebtn.backgroundColor = UIColor.clear
        }else if index == 1{
            self.onebtn.backgroundColor = UIColor.clear
            self.twobtn.backgroundColor = UIColor.clear
            self.threebtn.backgroundColor = UIColor.red
            
        }else{
            self.onebtn.backgroundColor = UIColor.red
            self.twobtn.backgroundColor = UIColor.clear
            self.threebtn.backgroundColor = UIColor.clear
            
        }

    }
    
    @IBAction func FirstBtnAction(_ sender: Any) {
        tutorialPageViewController?.scrollToViewController(index: 2, animal: false)
        self.changNavColor(index: 2)
    }
    
    
    @IBAction func SecendBtnAction(_ sender: Any) {
        tutorialPageViewController?.scrollToViewController(index: 0, animal: false)
        self.changNavColor(index: 0)
    }
    
    @IBAction func ThirthBtnAction(_ sender: Any) {
        tutorialPageViewController?.scrollToViewController(index: 1, animal: false)
        self.changNavColor(index: 1)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tutorialPageViewController = segue.destination as? TutorialPageViewController {
            self.tutorialPageViewController = tutorialPageViewController
        }
    }
    
    
    /**
     Fired when the user taps on the pageControl to change its current page.
     */
 
}

extension TutorialViewController: TutorialPageViewControllerDelegate {
    
    func tutorialPageViewController(_ tutorialPageViewController: TutorialPageViewController,
                                    didUpdatePageCount count: Int) {
        
        
        
     }
    
    func tutorialPageViewController(_ tutorialPageViewController: TutorialPageViewController,
                                    didUpdatePageIndex index: Int) {
        
        print(index)
        self.changNavColor(index: index)
        
        
     }
    
}
