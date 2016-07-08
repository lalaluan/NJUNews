//
//  DataTableViewCell.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 11/8/15.
//  Copyright © 2015 Yuji Hato. All rights reserved.
//

import UIKit

struct DataTableViewCellData {
    
    init(imageUrl: String, text: String) {
        self.imageName = imageUrl
        self.text = text
    }
    var imageName: String
    var text: String
}

class DataTableViewCell : BaseTableViewCell {
    
    @IBOutlet weak var dataImage: UIImageView!
    @IBOutlet weak var dataText: UILabel!
    
    override func awakeFromNib() {
        self.dataText?.font = UIFont.italicSystemFontOfSize(16)
        self.dataText?.textColor = UIColor(hex: "9E9E9E")
    }
 
    override class func height() -> CGFloat {
        return 80
    }
    
    override func setData(data: Any?) {
        if let data = data as? DataTableViewCellData {
            //self.dataImage.setRandomDownloadImage(80, height: 80)
            //如果需要修改图片的路径，仿照text的读取，修改dataImage的内容
            //self.dataImage.setRandomDownloadImage(80, height: 80)
            self.dataText.text = data.text
            //let imagePath:NSString = NSBundle.mainBundle().pathForResource("image1", ofType: "jpg")!
            let imagePath:NSString = NSBundle.mainBundle().pathForResource(data.imageName, ofType:"jpg")!
            let nsd = NSData(contentsOfFile : imagePath as String)
            self.dataImage.image = UIImage(data: nsd!);
        }
    }
}
