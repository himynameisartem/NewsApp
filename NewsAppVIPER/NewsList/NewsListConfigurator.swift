//
//  NewsListConfigurator.swift
//  NewsAppVIPER
//
//  Created by Артем Кудрявцев on 08.06.2023.
//

import Foundation

protocol NewsListConfiguratorProtocol: AnyObject {
    func configure(with viewController: NewsListViewController)
}

class NewsListCofigurator: NewsListConfiguratorProtocol {
    
    func configure(with viewController: NewsListViewController) {
        let presenter = NewsListPresenter(view: viewController)
        let interactor = NewsListInteractor(presenter: presenter)
        let router = NewsListRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
