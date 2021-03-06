//
//  UnitConversionViewController.swift
//  Baking Buddy
//
//  Created by Chris Millward on 2015-12-14.
//  Copyright © 2015 Pixel Pistol Games. All rights reserved.
//

import UIKit

class UnitConversionViewController: UIViewController {
    let url = "http://www.onlineconversion.com/cooking_volume.htm"
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

