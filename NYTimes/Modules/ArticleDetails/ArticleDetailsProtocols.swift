//
//  ArticleDetailsProtocols.swift
//  NYTimes
//
//  Created by Adnan on 3/3/20.
//  Copyright © 2020 Adnan. All rights reserved.
//

import Foundation

//MARK: Wireframe -
protocol ArticleDetailsWireframeProtocol: class {

}
//MARK: Presenter -
protocol ArticleDetailsPresenterProtocol: class {

    var interactor: ArticleDetailsInteractorInputProtocol? { get set }
    var article: Article { get set }
    
    func showArticleDetails()
}

//MARK: Interactor -
protocol ArticleDetailsInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
}

protocol ArticleDetailsInteractorInputProtocol: class {

    var presenter: ArticleDetailsInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
}

//MARK: View -
protocol ArticleDetailsViewProtocol: class {

    var presenter: ArticleDetailsPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
    func articleToShowDetails(article: Article)

}
