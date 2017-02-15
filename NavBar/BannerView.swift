//
//  BannerView.swift
//  NavBar
//
//  Created by 杜博 on 2017/2/15.
//  Copyright © 2017年 杜博. All rights reserved.
//

import UIKit

typealias TapImageViewBlock = (_ tag:Int) ->Void

class BannerView: UIView,UIScrollViewDelegate {
    var Tapdeletage:TapImageViewBlock?
    
    //定义一个全局变量
    var scrollerView : UIScrollView! = nil
    var pageControl : UIPageControl! = nil
    var timer : Timer! = nil
    var imageView :UIImageView! = nil
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    var imageCount = 0
    
    
    
     init(frame: CGRect, ImagesArr:[String]) {
        super.init(frame: frame)
        imageCount = ImagesArr.count
        
        self.scrollerView = UIScrollView.init(frame: CGRect(x: 0, y: 0, width: width, height: frame.size.height))
        self.addSubview(self.scrollerView)
        
        self.pageControl = UIPageControl.init(frame: .init(x: (frame.size.width - 100)/2, y:  frame.size.height - 20, width: 100, height: 20))
        self.addSubview(self.pageControl)
        
        
        let imageViewW = self.scrollerView.bounds.size.width
        let imageViewH = self.scrollerView.bounds.size.height
        
        for i in 0 ..< ImagesArr.count  {
             self.imageView = UIImageView.init()
            let TapGesture = UITapGestureRecognizer.init(target: self, action: #selector(imageViewTap(tap:)))
            self.imageView.isUserInteractionEnabled = true
            self.imageView.tag = i + 1
            self.imageView.addGestureRecognizer(TapGesture)
            
            let imageViewX = Int(imageViewW) * i;
            self.imageView.frame = .init(x: CGFloat(imageViewX), y: 0, width: imageViewW, height: imageViewH)
            
            // 3.设置图片
            // 拼接图片的名称
            self.imageView.image = UIImage(named: ImagesArr[i])
            self.scrollerView.addSubview(self.imageView)
 
        }
        
        self.scrollerView.contentSize = CGSize(width: Int(imageViewW) * ImagesArr.count, height: 0)
        self.scrollerView.showsHorizontalScrollIndicator = false
        self.scrollerView.showsVerticalScrollIndicator = false
        self.scrollerView.isPagingEnabled = true
        self.pageControl.numberOfPages = ImagesArr.count
        self.pageControl.currentPage = 0;
        self.pageControl.pageIndicatorTintColor = UIColor.purple
        self.pageControl.currentPageIndicatorTintColor = UIColor.orange
        self.scrollerView.delegate = self;
        self.scrollerView.bounces = false
        
        self.timerAction()
        
    }
    
    func timerAction() -> Void {
        if (timer == nil) {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(nextPageAction), userInfo: nil, repeats: true)
            RunLoop.current.add(timer, forMode: .commonModes)
        }
     }
    func nextPageAction(){
        
        var page = self.pageControl.currentPage;
        if (page == (self.imageCount - 1)){
            page = 0;
        } else {
            page += 1;
        }
        let offset = CGPoint(x: width * CGFloat(page), y: 0)
        self.scrollerView.setContentOffset(offset, animated: true)
    }
    
    func imageViewTap(tap:UITapGestureRecognizer) -> Void {
        
        NSLog("=============\(tap.view?.tag)")
        
              self.Tapdeletage!((tap.view?.tag)!)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}


extension BannerView{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewW = scrollView.bounds.size.width;
        let page = (scrollView.contentOffset.x + scrollViewW * 0.5) / scrollViewW;
        self.pageControl.currentPage = Int(page)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
         self.timer.invalidate()
        self.timer = nil;
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.timerAction()
    }
    
    
}





