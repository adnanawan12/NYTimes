//
//  ArticleTableViewCell.swift
//  NYTimes
//
//  Created by Adnan on 3/2/20.
//  Copyright © 2020 Adnan. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        titleLabel.text = ""
        overviewLabel.text = ""
        posterImageView.image = UIImage(named: "poster")
    }

}

extension ArticleTableViewCell {
    func displayContents(of article: Article) {
        titleLabel.text = article.title
        overviewLabel.text = article.abstract
        
        if(article.media.count > 0){
            let imageURLString = article.media[0].mediametadata[0].url
            posterImageView.setImage(from: imageURLString)
        }else{
            posterImageView.image = UIImage(named: "poster")
        }
        
    }
}
