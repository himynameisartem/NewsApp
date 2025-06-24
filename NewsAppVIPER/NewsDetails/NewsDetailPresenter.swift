//
//  NewsDetailPresenter.swift
//  NewsAppVIPER
//
//  Created by Артем Кудрявцев on 14.06.2023.
//

import Foundation

struct NewsDetailData {
    let newsImageData: Data?
    let date: String?
    let news: String?
}

protocol NewsDetailPresenterProtocol: AnyObject {
    func showDetailNews()
}

class NewsDetailPresenter {
    weak var view: NewsDetailViewController!
    var interactor: NewsDetailInteractorProtocol!
    
    required init(view: NewsDetailViewController!) {
        self.view = view
    }
}

extension NewsDetailPresenter: NewsDetailPresenterProtocol {
    func showDetailNews() {
        interactor.provideNewsDetail()
    }
}

extension NewsDetailPresenter: NewsDetailInteractorOutputProtocol {
    func recieveNewDetail(with newsDetailData: NewsDetailData) {
        view.setDate(with: newsDetailData.date)
        view.setText(with: newsDetailData.news)
        guard let imageData = newsDetailData.newsImageData else { return }
        view.setImage(with: imageData)
    }
    
    
}
