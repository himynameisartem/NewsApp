//
//  NewsDetailInteractor.swift
//  NewsAppVIPER
//
//  Created by Артем Кудрявцев on 14.06.2023.
//

import Foundation

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
        let newsDetailData = NewsDetailData(newsImage: news.urlToImage,
                                            date: DateManager.shared.dateFromString(with: news.publishedAt),
                                            news: news.description)
        presentor.recieveNewDetail(with: newsDetailData)
    }
}
