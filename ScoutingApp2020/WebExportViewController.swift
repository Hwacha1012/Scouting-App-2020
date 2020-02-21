//
//  WebExportViewController.swift
//  ScoutingApp2020
//
//  Created by Leonard Liu on 2/8/20.
//  Copyright © 2020 Leonard Liu. All rights reserved.
//

import UIKit

import WebKit

class WebExportViewController: UIViewController, WKNavigationDelegate {
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
