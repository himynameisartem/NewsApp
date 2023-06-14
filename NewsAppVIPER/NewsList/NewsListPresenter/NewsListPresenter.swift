//
//  NewsListPresenter.swift
//  NewsAppVIPER
//
//  Created by Артем Кудрявцев on 08.06.2023.
//

import Foundation

class NewsListPresenter {
    
    weak var view: NewsListViewProtocol!
    var interactor: NewsListInteractorProtocol!
    var router: NewsListRouterProtocol!
    
    var news: [Articles] = []
    var newsCount: Int? {
        news.count
    }
    
    required init(view: NewsListViewProtocol) {
        self.view = view
    }
}

extension NewsListPresenter: NewsListPresenterProtocol {
    func viewDidLoad() {
        interactor.fetchNews()
    }
    
    func news(atIndex indexPath: IndexPath) -> Articles? {
        if news.indices.contains(indexPath.row) {
            return news[indexPath.row]
        } else {
            return nil
        }
    }
    
    func showNewsDetails(for indexPath: IndexPath) {
        if news.indices.contains(indexPath.row) {
            let news = news[indexPath.row]
            router.openCourseDetailsViewController(with: news)
        }
    }
}

extension NewsListPresenter: NewsListInteractorOutputProtocol {
    func newsDidRecieve(_ news: [Articles]) {
        self.news = news
        view.reloadData()
    }
}
