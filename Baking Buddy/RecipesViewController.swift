//
//  RecipesViewController.swift
//  Baking Buddy
//
//  Created by Chris Millward on 2015-12-14.
//  Copyright © 2015 Pixel Pistol Games. All rights reserved.
//

import UIKit
import SafariServices

class RecipesViewController: UIViewController, SFSafariViewControllerDelegate {
    let urlString = "http://bakingbuddy.millwardesque.com"
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let requestURL = NSURL(string:urlString)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func openWithSafariVC(sender: AnyObject)
    {
        let svc = SFSafariViewController(URL: NSURL(string: self.urlString)!)
        svc.delegate = self
        self.presentViewController(svc, animated: true, completion: nil)
    }

    func safariViewControllerDidFinish(controller: SFSafariViewController)
    {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}

