//
//  ViewController.swift
//  SlideMenuControllerSwift
//
//  Created by lalalu on 16/5/29.
//  Copyright © 2016年 lalalu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var mainContens = ["data1", "data2", "data3", "data4", "data5", "data6", "data7", "data8", "data9", "data10", "data11", "data12", "data13", "data14", "data15"]
    var mainContents: Array<String> = []
    var mainImages: Array<String> = []
    //var mainContents = NSArray(contentsOfFile: NSBundle.mainBundle() + "/Source/test.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerCellNib(DataTableViewCell.self)
        
        let diaryList:NSString = NSBundle.mainBundle().pathForResource("mainContents", ofType:"plist")!
        //print("\(diaryList)")
       // var data:NSArray = NSArray(contentsOfFile:diaryList as String)!
        self.mainContents = NSArray(contentsOfFile: diaryList as String)! as! Array<String>
        //print(self.mainContents)
        
        let imageList:NSString = NSBundle.mainBundle().pathForResource("mainImages", ofType:"plist")!
        self.mainImages = NSArray(contentsOfFile: imageList as String)! as! Array<String>
        
        
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


extension MainViewController : UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return DataTableViewCell.height()
    }
}

extension MainViewController : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mainContents.count
    }
     
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier(DataTableViewCell.identifier) as! DataTableViewCell
        
        //var num = indexPath.section % 8
        //let content = self.mainContents?["\(num)"]
        //let url = content![indexPath.row]["url"] as! String
        //let name = content![indexPath.row]["name"] as! String
        //let data = DataTableViewCellData(imageUrl: "dummy", text: content as! String)
        
        let data = DataTableViewCellData(imageUrl: mainImages[indexPath.row], text: mainContents[indexPath.row])
        cell.setData(data)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let storyboard = UIStoryboard(name: "SubContentsViewController", bundle: nil)
        let subContentsVC = storyboard.instantiateViewControllerWithIdentifier("SubContentsViewController") as! SubContentsViewController
        subContentsVC.whichController = "Main"
        subContentsVC.whichRow = indexPath.row
        self.navigationController?.pushViewController(subContentsVC, animated: true)
    }
}

extension MainViewController : SlideMenuControllerDelegate {
    
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
