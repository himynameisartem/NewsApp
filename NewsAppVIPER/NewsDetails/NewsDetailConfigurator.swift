//
//  NewsDetailConfigurator.swift
//  NewsAppVIPER
//
//  Created by Артем Кудрявцев on 14.06.2023.
//

import Foundation

protocol NewsDetailConfiguratorProtocol: AnyObject {
    func configure(with viewController: NewsDetailViewController, and news: Articles)
}

class NewsDetailConfigurator: NewsDetailConfiguratorProtocol {
    func configure(with viewController: NewsDetailViewController, and news: Articles) {
        let presenter = NewsDetailPresenter(view: viewController)
        let interactor = NewsDetailInteractor(presentor: presenter, news: news)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
}
