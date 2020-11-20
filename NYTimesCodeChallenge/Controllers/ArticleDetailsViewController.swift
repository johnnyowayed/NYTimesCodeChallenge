//
//  ArticleDetailsViewController.swift
//  NYTimesCodeChallenge
//
//  Created by Johnny Owayed on 11/20/20.
//

import UIKit

class ArticleDetailsViewController: UIViewController {
    
    @IBOutlet weak var label_Title: UILabel!
    @IBOutlet weak var label_Abstract: UILabel!

    var articleDetailViewModel: ArticleDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.label_Title.textColor = .black
        self.label_Title.font = UIFont.boldSystemFont(ofSize: 18)
        self.label_Title.text = self.articleDetailViewModel.title
        
        self.label_Abstract.textColor = .darkGray
        self.label_Abstract.font = UIFont.systemFont(ofSize: 18)
        self.label_Abstract.text = self.articleDetailViewModel.abstract
       
    }
}
