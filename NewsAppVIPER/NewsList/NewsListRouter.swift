//
//  NewsListRouter.swift
//  NewsAppVIPER
//
//  Created by Артем Кудрявцев on 08.06.2023.
//

import Foundation

protocol NewsListRouterProtocol: AnyObject {
    func openCourseDetailsViewController(with news: Articles)
}

class NewsListRouter {
    
    weak var viewController: NewsListViewController!
    
    init(viewController: NewsListViewController) {
        self.viewController = viewController
    }
}

extension NewsListRouter: NewsListRouterProtocol {
    func openCourseDetailsViewController(with news: Articles) {
        viewController.performSegue(
            withIdentifier: viewController.selfToNewsDetailSegueName,
            sender: news)
    }
}
