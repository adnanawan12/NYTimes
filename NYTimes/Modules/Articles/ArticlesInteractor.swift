//
//  ArticlesInteractor.swift
//  NYTimes
//
//  Created by Adnan on 3/2/20.
//  Copyright © 2020 Adnan. All rights reserved.
//

import UIKit

class ArticlesInteractor: ArticlesInteractorInputProtocol {
    
    weak var presenter: ArticlesInteractorOutputProtocol?
    var articles: [Article] = []
    
    
    func loadArticles(_ category: Category) {
        print(category)
        
        // Decide which API to be called based on category
        var apiRouter = APIRouter.day
        switch category {
        case .day:
            apiRouter = .day
        case .week:
            apiRouter = .week
        case .month:
            apiRouter = .month
        }
       APIClient.sendRequest(router: apiRouter){ [weak self](data, error) in
            guard let weakSelf = self else { return }
            if let error = error {
                
               weakSelf.presenter?.articlesLoadFailed(error)
            } else {
                
                do {
                    let response = try JSONDecoder().decode(ArticlesResponse.self, from: data!) as ArticlesResponse
                    
                    if let data = data {
                        debugPrint(String(decoding: data, as: UTF8.self))
                    }
                    
                    
                    self?.articles = response.results
                    
                    weakSelf.presenter?.articlesLoaded(response.results)
                } catch  {
                    print(error)
                    weakSelf.presenter?.articlesLoadFailed(error)
                }
            }
        }
    }
    
    func searchArticles(text: String, category: Category) {
       
        
        let filtered = articles.filter{ $0.title.contains(text) }
        presenter?.articlesLoaded(filtered)
    
    }
    
    func clearSearch(category: Category) {
        presenter?.articlesLoaded(articles)
    }
    

}

