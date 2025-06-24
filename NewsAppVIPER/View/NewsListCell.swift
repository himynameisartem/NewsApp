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
        newsImageView.image = nil
        
        ImageManager.shared.loadImageFromURL(urlString: news.urlToImage) { [ weak self ] data in
            DispatchQueue.main.async {
                self?.newsImageView.image = UIImage(data: data)
                self?.loadImageActivityIndicator.stopAnimating()
            }
        }
    }
}
