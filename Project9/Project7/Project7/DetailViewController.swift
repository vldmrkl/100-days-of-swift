//
//  DetailViewController.swift
//  Project7
//
//  Created by Volodymyr Klymenko on 2020-01-14.
//  Copyright © 2020 Volodymyr Klymenko. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: Petition?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let detailItem = detailItem else { return }
        
        let html = """
        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <style>
                    h1 {
                        font-size: 150%;
                        font-weight: bold;
                    }

                    p {
                        font-size: 100%;
                    }
                </style>
            </head>
            <body>
                <h1>\(detailItem.title)</h1>
                <p>\(detailItem.body)</p>
            </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)
    }
}
