//
//  LoginViewController.swift
//  FizBuz
//
//  Created by Bharath on 24/04/19.
//  Copyright © 2019 TestCompany. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIWebViewDelegate {
@IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        request()
        // Do any additional setup after loading the view.
        
        
    }
    

    func request()
    {
        
        let url = String(format: "%@?client_id=%@&redirect_uri=%@&response_type=token&scope=%@&DEBUG=True", arguments: [INSTAGRAM_IDS.AUTHURL,INSTAGRAM_IDS.CLIENTID,INSTAGRAM_IDS.REDIRECTURL,INSTAGRAM_IDS.SCOPE])
        let request = URLRequest.init(url: URL.init(string: url)!)
        webView.loadRequest(request)
        
        
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request:URLRequest, navigationType: UIWebView.NavigationType) -> Bool{
        return checkRequestForCallbackURL(request: request)
    }
    
    func checkRequestForCallbackURL(request: URLRequest) -> Bool {
        let requestURLString = (request.url?.absoluteString)! as String
        if requestURLString.hasPrefix(INSTAGRAM_IDS.REDIRECTURL) {
            let range: Range<String.Index> = requestURLString.range(of: "#access_token=")!
            handleAuth(authToken: requestURLString.substring(from: range.upperBound))
            return false;
        }
        return true
    }
    
    func handleAuth(authToken: String) {
        print("Instagram authentication token ==", authToken)
    }


}
