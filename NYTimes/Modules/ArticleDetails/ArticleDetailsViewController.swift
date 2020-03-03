//
//  ArticleDetailsViewController.swift
//  NYTimes
//
//  Created by Adnan on 3/3/20.
//  Copyright © 2020 Adnan. All rights reserved.
//

import UIKit
import WebKit

class ArticleDetailsViewController: UIViewController {
    var webView: WKWebView!
    
    var presenter: ArticleDetailsPresenterProtocol?
    
    override func loadView() {
        super.loadView()
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.showArticleDetails()
        // Do any additional setup after loading the view.
    }

}

extension ArticleDetailsViewController: ArticleDetailsViewProtocol {
    func articleToShowDetails(article: Article) {
        self.title = article.title
        let articleURL = URL(string: article.url)
        webView.load(URLRequest(url: articleURL!))
    }
}

extension ArticleDetailsViewController:WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        
    }
}
