//
//  ViewController.swift
//  EasyBrowser
//
//  Created by Volodymyr Klymenko on 2019-03-18.
//  Copyright © 2019 Volodymyr Klymenko. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://react-cupertino.github.io/")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }


}

