//
//  ArticleDetailsRouter.swift
//  NYTimes
//
//  Created by Adnan on 3/3/20.
//  Copyright © 2020 Adnan. All rights reserved.
//

import UIKit

class ArticleDetailsRouter: ArticleDetailsWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule(with article: Article) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let storyBoard = UIStoryboard(name: Storyboard.main.rawValue, bundle: nil)
        let viewController = storyBoard.instantiateViewController(identifier: StoryboardID.articleDetailsViewController.rawValue) as! ArticleDetailsViewController
        let interactor = ArticleDetailsInteractor()
        let router = ArticleDetailsRouter()
        let presenter = ArticleDetailsPresenter(interface: viewController, interactor: interactor, router: router, article: article)

        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController

        return viewController
    }
}
