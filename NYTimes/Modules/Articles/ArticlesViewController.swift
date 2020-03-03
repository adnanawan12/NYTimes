//
//  ArticlesViewController.swift
//  NYTimes
//
//  Created by Adnan on 3/2/20.
//  Copyright © 2020 Adnan. All rights reserved.
//

import UIKit

class ArticlesViewController: UIViewController, ArticlesViewProtocol {
    @IBOutlet weak var searchBar: UISearchBar!
       @IBOutlet weak var tableView: UITableView!
       @IBOutlet weak var segmentedControl: UISegmentedControl!
       @IBOutlet weak var progressView: UIView!
       var articles: [Article]? = nil
       var presenter: ArticlesPresenterProtocol?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "NY Times Most Popular Articles"
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        

        ArticlesRouter.createModule(viewController: self)
        self.loadArticles(category: self.selectedCategory)
    }
    

   func articlesLoaded(_ articles: [Article]) {
        self.hideProgress()
        self.articles = articles
        self.tableView.reloadData()
    }
    
    func articlesLoadFailed(_ error: Error) {
        self.hideProgress()
        let alertViewController = UIAlertController(title: "", message: error.localizedDescription, preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertViewController, animated: true, completion: nil)
    }

}

// MARK: - Actions
extension ArticlesViewController {
    @IBAction func categoryAction(_ sender: UISegmentedControl) {
        self.loadArticles(category: self.selectedCategory)
    }
}
// MARK: - Private Methods
extension ArticlesViewController {
    private func loadArticles(category: Category) {
        self.searchBar.text = ""
        self.searchBar.resignFirstResponder()
        self.articles = []
        self.tableView.reloadData()
        self.showProgress()
        presenter?.loadArticles(category)
    }
    
    private func showProgress() {
        self.view.isUserInteractionEnabled = false
        //self.progressView.isHidden = false
    }
    
    private func hideProgress() {
        self.view.isUserInteractionEnabled = true
        //self.progressView.isHidden = true
    }
    
    private var selectedCategory: Category {
        get {
            return Category(rawValue: segmentedControl.selectedSegmentIndex) ?? Category.day
        }
    }
}
// MARK: - TableView DataSource
extension ArticlesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let articles = self.articles {
            return articles.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.articleTableViewCell.rawValue) as! ArticleTableViewCell
        cell.displayContents(of: self.articles![indexPath.row])
        return cell
    }
}
// MARK: - TableView Delegate
extension ArticlesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.showArticleDetails(article: self.articles![indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - SearchBar Delegate
extension ArticlesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            presenter?.clearSearch(category: self.selectedCategory)
        } else {
            presenter?.searchArticles(text: searchText, category: self.selectedCategory)
        }
    }
}
