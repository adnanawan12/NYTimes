//
//  ArticlesRouter.swift
//  NYTimes
//
//  Created by Adnan on 3/2/20.
//  Copyright © 2020 Adnan. All rights reserved.
//

import UIKit

class ArticlesRouter: ArticlesWireframeProtocol {
    
    weak var viewController: UIViewController?

    static func createModule(viewController: ArticlesViewController) {
        // Change to get view from storyboard if not using progammatic UI
        let interactor = ArticlesInteractor()
        let router = ArticlesRouter()
        let presenter = ArticlesPresenter(interface: viewController, interactor: interactor, router: router)

        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
    }
    
    func routeToArticleDetails(article: Article, title: String) {
        let articleDetailsViewController = ArticleDetailsRouter.createModule(with: article)
        articleDetailsViewController.title = title
        viewController?.navigationController?.pushViewController(articleDetailsViewController, animated: true)

    }
}
