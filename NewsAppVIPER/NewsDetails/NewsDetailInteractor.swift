//
//  NewsDetailInteractor.swift
//  NewsAppVIPER
//
//  Created by Артем Кудрявцев on 14.06.2023.
//

import Foundation

protocol NewsDetailInteractorProtocol: AnyObject {
    func provideNewsDetail()
}

protocol NewsDetailInteractorOutputProtocol: AnyObject {
    func recieveNewDetail(with newsDetailData: NewsDetailData)
}

class NewsDetailInteractor {
    
    weak var presentor: NewsDetailInteractorOutputProtocol!
    private var news: Articles
    
    init(presentor: NewsDetailInteractorOutputProtocol!, news: Articles) {
        self.presentor = presentor
        self.news = news
    }
}

extension NewsDetailInteractor: NewsDetailInteractorProtocol {
    func provideNewsDetail() {
        ImageManager.shared.loadImageFromURL(urlString: news.urlToImage) { data in
            let newsDetailData = NewsDetailData(newsImageData: data,
                                            date: DateManager.shared.dateFromString(with: self.news.publishedAt),
                                            news: self.news.description)
            self.presentor.recieveNewDetail(with: newsDetailData)
        }
    }
}
