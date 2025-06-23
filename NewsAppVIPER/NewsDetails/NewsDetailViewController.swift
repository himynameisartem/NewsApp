//
//  NewsDetailViewController.swift
//  NewsAppVIPER
//
//  Created by Артем Кудрявцев on 13.06.2023.
//

import UIKit

protocol NewsDetailViewControllerProtocol {
    func setImage(with imageString: String?)
    func setDate(with date: String?)
    func setText(with text: String?)
}

class NewsDetailViewController: UIViewController {
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var newsLabel: UILabel!
    
    var presenter: NewsDetailPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.showDetailNews()
        
    }
}

extension NewsDetailViewController: NewsDetailViewControllerProtocol {
    
    func setImage(with imageString: String?) {
        ImageManager.shared.loadImageFromURL(urlString: imageString ?? "") { image in
            DispatchQueue.main.async {
                self.newsImage.image = image
            }
        }
    }
    
    func setDate(with date: String?) {
        dateLabel.text = date
    }
    
    func setText(with text: String?) {
        newsLabel.text = text
    }
}
