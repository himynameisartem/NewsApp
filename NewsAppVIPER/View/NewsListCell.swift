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
        guard let image = ImageManager.shared.getImageData(from: news.urlToImage) else { return }
        DispatchQueue.main.async {
            self.newsImageView.image = UIImage(data: image)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
}
