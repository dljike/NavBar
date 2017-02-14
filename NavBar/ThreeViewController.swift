//
//  ThreeViewController.swift
//  NavBar
//
//  Created by 杜博 on 2017/2/13.
//  Copyright © 2017年 杜博. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

    
        self.view.addSubview(self.mytableView)
        self.mytableView.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(self.view)
            make.bottom.equalTo(self.view).offset(-64)
        }

    }

    
    private lazy var mytableView: UITableView = {
        let tableView = UITableView()
        let nib = UINib(nibName: String("ThreeTableViewCell"), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "threecell")
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        
       let cell = tableView.dequeueReusableCell(withIdentifier: "threecell")
        
         cell?.textLabel?.text = "\(indexPath.row)"
        return cell!
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
