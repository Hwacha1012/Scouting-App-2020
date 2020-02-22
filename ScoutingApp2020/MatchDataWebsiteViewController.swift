//
//  MatchDataWebsiteViewController.swift
//  ScoutingApp2020
//
//  Created by ghsrobotics on 2/22/20.
//  Copyright © 2020 Leonard Liu. All rights reserved.
//

import UIKit

import WebKit



class MatchDataWebsiteViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var matchDataWebsite: WKWebView!
    
    var webView: WKWebView!
    var webUrl = "http://ec2-52-71-196-37.compute-1.amazonaws.com/matchdata/html"
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
          // 1
            let url = URL(string: webUrl)!
            webView.load(URLRequest(url: url))
              
            // 2
            let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
            toolbarItems = [refresh]
            navigationController?.isToolbarHidden = false
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
        }

        // Do any additional setup after loading the view.
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
