//
//  NewsListIneractor.swift
//  NewsAppVIPER
//
//  Created by Артем Кудрявцев on 08.06.2023.
//

import Foundation

protocol NewsListInteractorProtocol: AnyObject {
    func fetchNews()
}

protocol NewsListInteractorOutputProtocol: AnyObject {
    func newsDidRecieve(_ news: [Articles])
    func handleError(_ error: Error)
}

class NewsListInteractor {
    
    weak var presenter: NewsListInteractorOutputProtocol!
    
    init(presenter: NewsListInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

extension NewsListInteractor: NewsListInteractorProtocol {
    func fetchNews() {
        NetworkManager.shared.fetchNews { [weak self] result in
            switch result {
            case .success(let news):
                self?.presenter?.newsDidRecieve(news)
            case .failure(let error):
                self?.presenter?.handleError(error)
            }
        }
    }
}
