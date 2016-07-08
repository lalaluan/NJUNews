//
//  ViewController.swift
//  SlideMenuControllerSwift
//
//  Created by lalalu on 16/5/29.
//  Copyright © 2016年 lalalu. All rights reserved.
//

import UIKit

class OfficeViewController: UIViewController {
    
   /* override func viewDidLoad() {
        super.viewDidLoad()
    }
 
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
    }*/
    
    @IBOutlet weak var tableView: UITableView!
    
    var mainContens = ["data1", "data2", "data3", "data4", "data5", "data6", "data7", "data8", "data9", "data10", "data11", "data12", "data13", "data14", "data15"]
    var officeImages: Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerCellNib(DataTableViewCell.self)
        let imageList:NSString = NSBundle.mainBundle().pathForResource("mainImages", ofType:"plist")!
        self.officeImages = NSArray(contentsOfFile: imageList as String)! as! Array<String>
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //函数是在SlideMenuControllerSwift中定义的，这里可以用是因为，定义在UIViewController extension中
        self.setNavigationBarItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


extension OfficeViewController : UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return DataTableViewCell.height() //为什么可以直接用DataTableViewCell,cell的delegate和这个有关
    }
}

extension OfficeViewController : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mainContens.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier(DataTableViewCell.identifier) as! DataTableViewCell
        //与cell的datasource相关
        let data = DataTableViewCellData(imageUrl: officeImages[indexPath.row], text: mainContens[indexPath.row])
        cell.setData(data)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let storyboard = UIStoryboard(name: "SubContentsViewController", bundle: nil)
        let subContentsVC = storyboard.instantiateViewControllerWithIdentifier("SubContentsViewController") as! SubContentsViewController
        subContentsVC.whichController = "Office"
        subContentsVC.whichRow = indexPath.row
        self.navigationController?.pushViewController(subContentsVC, animated: true)
    }
}

extension OfficeViewController : SlideMenuControllerDelegate {
    
    func leftWillOpen() {
        print("SlideMenuControllerDelegate: leftWillOpen")
    }
    
    func leftDidOpen() {
        print("SlideMenuControllerDelegate: leftDidOpen")
    }
    
    func leftWillClose() {
        print("SlideMenuControllerDelegate: leftWillClose")
    }
    
    func leftDidClose() {
        print("SlideMenuControllerDelegate: leftDidClose")
    }
    
    func rightWillOpen() {
        print("SlideMenuControllerDelegate: rightWillOpen")
    }
    
    func rightDidOpen() {
        print("SlideMenuControllerDelegate: rightDidOpen")
    }
    
    func rightWillClose() {
        print("SlideMenuControllerDelegate: rightWillClose")
    }
    
    func rightDidClose() {
        print("SlideMenuControllerDelegate: rightDidClose")
    }
}