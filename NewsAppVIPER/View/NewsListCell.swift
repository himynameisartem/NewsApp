//
//  NewsListCell.swift
//  NewsAppVIPER
//
//  Created by Артем Кудрявцев on 07.06.2023.
//

import UIKit

class NewsListCell: UITableViewCell {

    @IBOutlet var newsImageView: UIImageView!
    @IBOutlet var titleNewsLabel: UILabel!
    @IBOutlet var dateNewsLabel: UILabel!
    
    func configure(news: Articles) {
        titleNewsLabel.text = news.title
        guard let imageUrl = URL(string: news.urlToImage ?? "https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg") else { return }
        ImageManager.shared.loadImageFromURL(url: imageUrl) { image in
                if let image = image {
                    DispatchQueue.main.async {
                        self.newsImageView.image = image
                    }
                } else {
                        print("loading image error")
                }
            }
        }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
}
