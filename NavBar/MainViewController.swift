//
//  MainViewController.swift
//  NavBar
//
//  Created by 杜博 on 2017/2/14.
//  Copyright © 2017年 杜博. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var pageViewController: UIPageViewController!
    var movieController: MovieViewController!
    var musicController: MusicViewController!
    var bookController: BookViewController!
    var controllers = [UIViewController]()

    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        //获取到嵌入的UIPageViewController
        pageViewController = self.childViewControllers.first as! UIPageViewController
        
        //根据Storyboard ID来创建一个View Controller
        movieController = storyboard?.instantiateViewController(withIdentifier: "MovieControllerID") as! MovieViewController
        musicController = storyboard?.instantiateViewController(withIdentifier: "MusicControllerID") as! MusicViewController
        bookController = storyboard?.instantiateViewController(withIdentifier: "BookControllerID") as! BookViewController
        
        //设置pageViewController的数据源代理为当前Controller
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        //手动为pageViewController提供提一个页面
        pageViewController.setViewControllers([movieController], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
        //把页面添加到数组中
        controllers.append(movieController)
        controllers.append(musicController)
        controllers.append(bookController)
        

    
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 

}

extension MainViewController:UIPageViewControllerDataSource,UIPageViewControllerDelegate {
        
        //返回当前页面的下一个页面
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            
            if viewController.isKind(of: MovieViewController.self) {
                return bookController
            }
            else if viewController.isKind(of: MusicViewController.self) {
                return movieController
            }
            return nil
            
        }
        
        //返回当前页面的上一个页面
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            
            if viewController.isKind(of: MovieViewController.self) {
                return musicController
            }
            else if viewController.isKind(of: BookViewController.self) {
                return movieController
            }
            return nil
        }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
        
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
    }
}


