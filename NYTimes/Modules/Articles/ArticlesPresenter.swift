//
//  ArticlesPresenter.swift
//  NYTimes
//
//  Created by Adnan on 3/2/20.
//  Copyright © 2020 Adnan. All rights reserved.
//

import UIKit

class ArticlesPresenter: ArticlesPresenterProtocol {
    

    weak private var view: ArticlesViewProtocol?
    var interactor: ArticlesInteractorInputProtocol?
    private let router: ArticlesWireframeProtocol
    init(interface: ArticlesViewProtocol, interactor: ArticlesInteractorInputProtocol?, router: ArticlesWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    //load articles under a category
    func loadArticles(_ category: Category) {
        interactor?.loadArticles(category)
    }
    
    //Search Articles for a string under a category
    func searchArticles(text: String, category: Category) {
        interactor?.searchArticles(text: text, category: category)
    }
    
    //Remove search filter for a category
    func clearSearch(category: Category) {
        interactor?.clearSearch(category: category)
    }
    
    //Show movie details screen
    func showArticleDetails(article: Article) {
        router.routeToArticleDetails(article: article, title: "Article Details")
    }
}

//Interactor responses are handled here
extension ArticlesPresenter: ArticlesInteractorOutputProtocol {
    func articlesLoaded(_ articles: [Article]) {
        DispatchQueue.main.async {[weak self] in
            self?.view?.articlesLoaded(articles)
        }
    }
    
    func articlesLoadFailed(_ error: Error) {
        DispatchQueue.main.async {[weak self] in
            self?.view?.articlesLoadFailed(error)
        }
    }
}
