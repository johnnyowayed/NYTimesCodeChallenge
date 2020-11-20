//
//  ActicleListTableViewController.swift
//  NYTimesCodeChallenge
//
//  Created by Johnny Owayed on 11/20/20.
//

import UIKit

class ArticleListTableViewController: UITableViewController {

    private var articleListViewModel: ArticleListViewModel!
    var indicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "NY Times Most Popular"
        self.tableView.accessibilityIdentifier = "tableView"
        self.createIndicator()
        self.fetchNewsArticles()
    }
    
    // MARK: - Fetch News Articles
    private func fetchNewsArticles() {
        self.indicator.startAnimating()
        APICalls.fetchNewsArticles { (articles) in
            self.indicator.stopAnimating()
            self.articleListViewModel = ArticleListViewModel(articles: articles)
            
            self.tableView.reloadData()
        } errorCallback: { (error) in
            self.indicator.stopAnimating()
            print(error?.localizedDescription ?? "")
        }
    }
    
    // MARK: - Create Indicator
    private func createIndicator() {
        self.indicator = UIActivityIndicatorView(style: .large)
        self.indicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        self.indicator.center = view.center
        self.view.addSubview(self.indicator)
        self.view.bringSubviewToFront(indicator)
    }
}

// MARK: - Table view data source
extension ArticleListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListViewModel == nil ? 0 : self.articleListViewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else{
            fatalError("Cell not found")
        }
        
        cell.accessoryType = .disclosureIndicator
        cell.accessibilityIdentifier = "cell: \(indexPath.row)"
        
        let articleViewModel = self.articleListViewModel.articleAtIndex(indexPath.row)
        cell.label_Title.text = articleViewModel.title
        cell.label_Subtitle.text = articleViewModel.subtitle
        cell.label_Date.text = articleViewModel.date
        cell.view_Circular.backgroundColor = .lightGray
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        if let vc = storyboard?.instantiateViewController(identifier: "ArticleDetails") as? ArticleDetailsViewController {
            vc.articleDetailViewModel = ArticleDetailViewModel.init(self.articleListViewModel.articles[indexPath.row])
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
