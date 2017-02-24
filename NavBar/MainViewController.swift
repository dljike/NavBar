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

    @IBOutlet var navView: UIView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.titleView = self.navView
        
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
        
        for vvvv:UIView in self.pageViewController.view.subviews {
            if  vvvv is UIScrollView {
                let tem:UIScrollView =  vvvv as! UIScrollView
                tem.delegate = self
                
            }
        }

        
        
    }

    @IBAction func OnePageAction(_ sender: Any) {
        
        pageViewController.setViewControllers([musicController], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        
    }

    @IBAction func twoViewController(_ sender: Any) {
        pageViewController.setViewControllers([movieController], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
    }
    
    @IBAction func threePageAction(_ sender: Any) {
        pageViewController.setViewControllers([bookController], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
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
    // 将要偏移
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
        
    }
    // 偏移完成
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
      
//        print("========",finished)
//        print("--------",completed)

        // 第二种方法
//        print("~~第二种~~~~",controllers .index(of: previousViewControllers[0]) ?? 000)
        // 第三种
        let index = self.pageViewController.viewControllers
        var i = 0
        for tep in controllers {
            i += 1
            if tep == index?[0] {
//             print("第三种",i)

                return
            }
            
        }
        
    }
    
    
}


extension MainViewController:UIScrollViewDelegate{

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(scrollView.contentOffset.x)
    }

}

