//
//  BookViewController.swift
//  NavBar
//
//  Created by 杜博 on 2017/2/14.
//  Copyright © 2017年 杜博. All rights reserved.
//

import UIKit
import Social


class BookViewController: UIViewController,DBScrollBannerViewDelegate,BrowserViewDelegate,HJImageBrowserDelegate {

     let screenWidth =  UIScreen.main.bounds.size.width
    var bannerView : DBScrollBannerView! = nil
    var screenView : ImgeBrowserManage! = nil
    override func viewDidLoad() {
        super.viewDidLoad()

         bannerView = DBScrollBannerView.init(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300), ImagesArr: ["img_01","img_02","img_03","img_04","img_05"])
        bannerView.delegate = self
        self.view.addSubview(bannerView)
        
        
    }
    
    func handleTapAction(index: Int) {
         print("==========\(index)")
        let dataArray = ["http://p2.qhimg.com/t011fc13354f12d1a46.jpg",
                         "http://img.bimg.126.net/photo/Q_YgZ2eYuC1qtuBXeAFMXQ==/1457758904385917359.jpg",
                         "http://img.taopic.com/uploads/allimg/140714/234975-140G4155Z571.jpg",
                         "http://image.tianjimedia.com/uploadImages/2012/233/37/HF17SP1LG9QQ.jpg",
                         "http://pic23.nipic.com/20120908/3073979_090316421000_2.jpg",
                         "http://image.tianjimedia.com/uploadImages/2015/129/56/J63MI042Z4P8.jpg",
                         "http://image.tianjimedia.com/uploadImages/2012/233/26/QNK85ZK47V2R.jpg",
                         "http://n.7k7kimg.cn/2015/0723/1437613406241.jpg",
                         "http://img.taopic.com/uploads/allimg/120425/95478-12042511120249.jpg",
                         "http://v1.qzone.cc/pic/201306/29/17/10/51cea48cb4d54713.jpg%21600x600.jpg"]
        
        
//        screenView = ImgeBrowserManage.init(frame: self.view.bounds, ImagesArr: ["img_01","img_02","img_03","img_04","img_05"])
//        screenView.delegate = self
//        screenView.show()
        
        
        
        
        let bview = HJImageBrowser()
        
//        bview.delegate = self
        
        bview.bottomView = self.view
        
        bview.indexImage = index
        
        bview.defaultImage = getColorImageWithColor()
        
        bview.arrayImage = dataArray
        
        bview.show()
        
        // 分享
        
//        let textToShare = "百度"
//        let imageToShare = UIImage.init(named: "img_01")
//        let urlToShare = NSURL.init(string: "http://www.baidu.com")
//        let items = [textToShare,imageToShare ?? "WeShare",urlToShare ?? "WeShare"] as [Any]
//        let activityVC = UIActivityViewController(
//            activityItems: items,
//            applicationActivities: nil)
//        
//        self.present(activityVC, animated: true, completion: { () -> Void in
//            
//        })
//
//        activityVC.completionWithItemsHandler =  { activity, success, items, error in
//         print(
//            activity ?? 111)
//            print(success)
//            print(items ?? 2222)
//            print(error ?? 33333)
//        
//        }
        
    
    
    }

    
    
    func getTheThumbnailImage(_ indexRow: Int) -> UIImage {
        
//        let indexPath = IndexPath.init(row: indexRow, section: 0)
//        
//        let cell = bannerView
//        
//        if cell == nil {
//            
            return getColorImageWithColor()
//
//        }
        
        var imagV = UIImageView()
        
//        for temp in (cell?.subviews)! {
//            
//            if temp.isKind(of: UIImageView.classForCoder()) {
//                
//                imagV = temp as! UIImageView
//                
//            }
//            
//        }
        
//        return imagV.image!
    }
    

    
    func browserHandleTapAction(index: Int) {
        screenView.removeFromSuperview()
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
