//
//  MovieViewController.swift
//  NavBar
//
//  Created by 杜博 on 2017/2/14.
//  Copyright © 2017年 杜博. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class MovieViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var imgArr:[UIImage] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        for index in 1...5 {
            let name = "img_0\(index)"
            
            let img = UIImage.init(named: name)
            imgArr.append(img!)
            
        }
        
        // Do any additional setup after loading the view.
        
        self.tableview.emptyDataSetSource = self
        self.tableview.emptyDataSetDelegate = self
        self.tableview.delegate = self
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}


extension MovieViewController:DZNEmptyDataSetDelegate,DZNEmptyDataSetSource{
    
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
 
        let attributeString = NSMutableAttributedString(string: "我我我哦哦", attributes: nil)
        attributeString.addAttributes([NSForegroundColorAttributeName:UIColor.red,NSFontAttributeName:UIFont.boldSystemFont(ofSize: 17)], range: NSMakeRange(0, 5))
        
        return attributeString
        
    }
    func backgroundColor(forEmptyDataSet scrollView: UIScrollView!) -> UIColor! {
        return UIColor.gray
    }
    
}

extension MovieViewController:UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate{

    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MoviewTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MoviewTableViewCell", for: indexPath as IndexPath) as! MoviewTableViewCell
        
//        cell.imgView.animationImages =  imgArr
//        cell.imgView.animationRepeatCount = Int(INT16_MAX)
//        cell.imgView.animationDuration = Double(imgArr.count) * 0.1
//        cell.imgView.startAnimating()
        
        return cell
    }


    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
//        let cell = cell as! MoviewTableViewCell
//                cell.imgView.animationImages =  imgArr
//                cell.imgView.animationRepeatCount = Int(INT16_MAX) // 0
//                cell.imgView.animationDuration = Double(imgArr.count) * 0.1
//                cell.imgView.startAnimating()

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
 
    



}
