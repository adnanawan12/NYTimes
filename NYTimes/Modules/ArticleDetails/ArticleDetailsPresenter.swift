//
//  ArticleDetailsPresenter.swift
//  NYTimes
//
//  Created by Adnan on 3/3/20.
//  Copyright © 2020 Adnan. All rights reserved.
//

import UIKit

class ArticleDetailsPresenter: ArticleDetailsPresenterProtocol, ArticleDetailsInteractorOutputProtocol {

    weak private var view: ArticleDetailsViewProtocol?
    var interactor: ArticleDetailsInteractorInputProtocol?
    private let router: ArticleDetailsWireframeProtocol
    var article: Article

    init(interface: ArticleDetailsViewProtocol, interactor: ArticleDetailsInteractorInputProtocol?, router: ArticleDetailsWireframeProtocol, article: Article) {
        self.view = interface
        self.interactor = interactor
        self.router = router
        self.article = article
    }

    func showArticleDetails() {
        DispatchQueue.main.async { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.view?.articleToShowDetails(article: weakSelf.article)
        }
    }
}
