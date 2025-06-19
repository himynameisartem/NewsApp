//
//  NewsListCell.swift
//  NewsAppVIPER
//
//  Created by Артем Кудрявцев on 07.06.2023.
//

import UIKit

class NewsListCell: UITableViewCell {
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleNewsLabel: UILabel!
    @IBOutlet weak var dateNewsLabel: UILabel!
    @IBOutlet weak var sourceNewsLabel: UILabel!
    @IBOutlet weak var loadImageActivityIndicator: UIActivityIndicatorView!
    
    private var currentImageURL: String?
    
    func configure(news: Articles) {
        titleNewsLabel.text = news.title
        dateNewsLabel.text = DateManager.shared.dateFromString(with: news.publishedAt)
        loadImageActivityIndicator.startAnimating()
        if let currentImageURL = currentImageURL, currentImageURL != news.urlToImage {
            ImageManager.shared.cancelImageLoading(for: currentImageURL)
        }
        currentImageURL = news.urlToImage
        newsImageView.image = nil
        ImageManager.shared.loadImageFromURL(urlString: news.urlToImage ?? "") { [weak self] image in
            DispatchQueue.main.async {
                if let self = self, self.currentImageURL == news.urlToImage {
                    self.newsImageView.image = image
                    self.loadImageActivityIndicator.stopAnimating()
                }
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
