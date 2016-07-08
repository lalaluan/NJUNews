//
//  SubContentsViewController.swift
//  SlideMenuControllerSwift
//
//  Created by lalalu on 16/5/29.
//  Copyright © 2016年 lalalu. All rights reserved.
import UIKit

class SubContentsViewController : UIViewController/*, UIWebViewDelegate*/ {
    
    @IBOutlet weak var webView: UIWebView!
    var whichController = " "
    var whichRow = 0
    var htmlArray: Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var webView = UIWebView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
        
        let htmlListFile = NSBundle.mainBundle().pathForResource("htmlList"+"\(self.whichController)", ofType: "plist")
        htmlArray = NSArray(contentsOfFile: htmlListFile! as String) as! Array<String>
        
        if let htmlFile = NSBundle.mainBundle().pathForResource(htmlArray[whichRow], ofType: "html"){
            let htmlData = NSData(contentsOfFile: htmlFile)
            let baseURL = NSURL.fileURLWithPath(NSBundle.mainBundle().bundlePath)
            //webView.loadData(htmlData!, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
            webView.loadData(htmlData!, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
            //print("27:" + htmlFile)
            //print(baseURL)
        }
        
        
        webView.scalesPageToFit = true
        self.view.addSubview(webView)
        
        
        
        
        /*var webView = UIWebView(frame: CGRectMake(0, 0, 600, 600))
        
        var url = NSURL(string: "http://www.google.com")
        
        webView.loadRequest(NSURLRequest(URL: url!))
        
        self.view.addSubview(webView)*/
        
        
       
        
        
    }
    
    /*override func viewWillAppear(animated: Bool) {
        let url = NSURL(string: "http://www.baidu.com")!
        
         // 2.建立网络请求
         let request = NSURLRequest(URL: url)
         
         // 3.加载网络请求
         self.webView.loadRequest(request)
    }*/
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
    
    /*var gmTableCount = 1
    var gmCenterView = UIView()
    var gmWebView = UIWebView()
    init(frame: CGRect) {
        view.init(frame: frame)
        // Initialization code
        initJobs()
    }
    
    func initJobs() {
        mainView.backgroundColor = UIColor.whiteColor()
        var bgview = UIView()
        bgview.frame = mainView.bounds
        addWebView()
        addButtons()
    }
    
    
    
    func addCenterView() {
        gmCenterView.frame =
            CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-50)
    }
    
    func addWebView() {
        gmWebView.frame =
            CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 50)
        gmWebView.backgroundColor = UIColor.whiteColor()
        gmWebView.delegate = self
        gmWebView.opaque = false
        gmWebView.userInteractionEnabled = true
        var url = NSURL.URLWithString("http://www.yahoo.com/")
        var req = NSURLRequest(URL: url)
        gmWebView.loadRequest(req)
        addSubview(gmWebView)
    }
    
    //==== webview functions ====
    func webView(webView: UIWebView!,
                 shouldStartLoadWithRequest request: NSURLRequest!,
                                            navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
    
    func webViewDidStartLoad(webView: UIWebView!) {
        println("start loading...")
    }
    
    func webViewDidFinishLoad(webView: UIWebView!) {
        println("finished loading!!")
    }
    
    func webView(webView: UIWebView!, didFailLoadWithError error: NSError!) {
        println("has problem: \(error.localizedDescription)")
    }
    
    //==== buttons ====
    func addButtons() {
        var w = self.frame.size.width / 2
        var h = 50.0
        var x = 0.0
        var y = self.frame.size.height - h
        var prevBtn = UIButton()
        prevBtn.frame = CGRectMake(x, y, w, h)
        prevBtn.backgroundColor = UIColor.blackColor()
        prevBtn.setTitle("<-", forState: .Normal)
        prevBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        prevBtn.setTitleColor(UIColor.redColor(), forState: .Highlighted)
        prevBtn.addTarget(self, action: "actPrevButton",
                          forControlEvents: .TouchUpInside)
        addSubview(prevBtn)
        x += prevBtn.frame.size.width
        var nextBtn = UIButton()
        nextBtn.frame = CGRectMake(x, y, w, h)
        nextBtn.backgroundColor = UIColor.blackColor()
        nextBtn.setTitle("->", forState: .Normal)
        nextBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        nextBtn.setTitleColor(UIColor.redColor(), forState: .Highlighted)
        nextBtn.addTarget(self, action: "actNextButton",
                          forControlEvents: .TouchUpInside)
        addSubview(nextBtn)
    }
    
    func actNextButton() {
        gmWebView.goForward()
    }
    
    func actPrevButton() {
        gmWebView.goBack()
    }*/
}
