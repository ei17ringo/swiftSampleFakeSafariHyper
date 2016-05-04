//
//  ViewController.swift
//  swiftSampleFakeSafariHyper
//
//  Created by Eriko Ichinohe on 2016/02/02.
//  Copyright © 2016年 Eriko Ichinohe. All rights reserved.
//

import UIKit
import Social


class ViewController: UIViewController {

    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var btnSearch: UIButton!
    
    @IBOutlet weak var btnTweet: UIButton!
    
    
    @IBOutlet weak var myWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        //ユーザデフォルトを用意する
        var myDefault = NSUserDefaults.standardUserDefaults()
        
        //データを読みだして
        var URLText = myDefault.stringForKey("URLText")
        //　文字列が入っていたらWebViewに表示する
        if let tmpStr = URLText{
            // URLリクエストを作って
            let myURL = NSURL(string: tmpStr)
            
            let myURLReq = NSURLRequest(URL: myURL!)
            myWebView.loadRequest(myURLReq)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapSearchBtn(sender: UIButton) {
        //WebViewに表示
        var URLText = myTextField.text
        
        //　文字列が入っていたらWebViewに表示する
        if let tmpStr = URLText{
            // URLリクエストを作って
            let myURL = NSURL(string: tmpStr)
            
            let myURLReq = NSURLRequest(URL: myURL!)
            myWebView.loadRequest(myURLReq)
            
            //ユーザデフォルトを用意する
            var myDefault = NSUserDefaults.standardUserDefaults()
            
            //データを書きこんで
            myDefault.setObject(myTextField.text!, forKey: "URLText")
            
            //即反映させる
            myDefault.synchronize()
            
        }
        
        
    }
    
    @IBAction func tapTweetBtn(sender: UIButton) {
        //Facebookにシェア
        let FacebookVC = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        
        if let tmpStr =  myTextField.text{
            // URLリクエストを作って
            let url = NSURL(string: tmpStr)
            
            FacebookVC.addURL(url)
            
        }

        
        presentViewController(FacebookVC, animated: true, completion: nil)
    }
    
    @IBAction func swipeDown(sender: UISwipeGestureRecognizer) {
        
        myTextField.resignFirstResponder()
    }
    
    
    //GestureRecognizerのdelegateをselfに設定して使用する
    func gestureRecognizer(
        gestureRecognizer: UIGestureRecognizer,
        shouldRecognizeSimultaneouslyWithGestureRecognizer
        otherGestureRecognizer: UIGestureRecognizer
        ) -> Bool {
            return true
    }

}

