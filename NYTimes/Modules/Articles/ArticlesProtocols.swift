//
//  ArticlesProtocols.swift
//  NYTimes
//
//  Created by Adnan on 3/2/20.
//  Copyright © 2020 Adnan. All rights reserved.
//

import Foundation

//MARK: Wireframe -
protocol ArticlesWireframeProtocol: class {
    func routeToArticleDetails(article: Article, title: String)
}
//MARK: Presenter -
protocol ArticlesPresenterProtocol: class {

    var interactor: ArticlesInteractorInputProtocol? { get set }
    
    func loadArticles(_ category: Category)
    func searchArticles(text: String, category: Category)
    func clearSearch(category: Category)
    func showArticleDetails(article: Article)
}

//MARK: Interactor -
protocol ArticlesInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
    func articlesLoaded(_ articles: [Article])
    func articlesLoadFailed(_ error: Error)
}

protocol ArticlesInteractorInputProtocol: class {

    var presenter: ArticlesInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
    func loadArticles(_ category: Category)
    func searchArticles(text: String, category: Category)
    func clearSearch(category: Category)
}

//MARK: View -
protocol ArticlesViewProtocol: class {

    var presenter: ArticlesPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
    func articlesLoaded(_ articles: [Article])
    func articlesLoadFailed(_ error: Error)
}

