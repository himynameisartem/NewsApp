//
//  NewsListPresenter.swift
//  NewsAppVIPER
//
//  Created by Артем Кудрявцев on 08.06.2023.
//

import Foundation
import Alamofire

protocol NewsListPresenterProtocol: AnyObject {
    var news: [Articles] { get }
    var newsCount: Int? { get }
    func viewDidLoad()
    func news(atIndex indexPath: IndexPath) -> Articles?
    func showNewsDetails(for indexPath: IndexPath)
}

class NewsListPresenter {
    
    weak var view: NewsListViewProtocol!
    var interactor: NewsListInteractorProtocol!
    var router: NewsListRouterProtocol!
    
    var news: [Articles] = []
    var newsCount: Int? {
        news.count
    }
    
    init(view: NewsListViewProtocol) {
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
    
    func handleError(_ error: any Error) {
        var errorMessage: String
        switch error {
        case is DecodingError:
            errorMessage = "Data loading error. Try it later."
        case let afError as AFError:
            errorMessage = afError.localizedDescription
        default:
            errorMessage = "Unknown error"
        }
        view.showError(errorMessage)
    }
}

