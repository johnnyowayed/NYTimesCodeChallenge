//
//  ArticleTableViewCell.swift
//  NYTimesCodeChallenge
//
//  Created by Johnny Owayed on 11/20/20.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var label_Title: UILabel!
    @IBOutlet weak var label_Subtitle: UILabel!
    @IBOutlet weak var label_Date: UILabel!
    @IBOutlet weak var view_Circular: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Setup Cell Design
        self.view_Circular.layer.cornerRadius = self.view_Circular.frame.height/2
        self.view_Circular.layer.masksToBounds = true
        self.view_Circular.backgroundColor = .lightGray
        
        self.label_Title.textColor = .black
        self.label_Title.font = UIFont.boldSystemFont(ofSize: 18)
        self.label_Title.numberOfLines = 2
        
        self.label_Subtitle.textColor = .gray
        self.label_Subtitle.font = UIFont.systemFont(ofSize: 18)
        self.label_Subtitle.numberOfLines = 2
        
        self.label_Date.textColor = .gray
        self.label_Date.font = UIFont.systemFont(ofSize: 14)
    }
}
