//
//  NewsDetailConfiguratorProtocol.swift
//  NewsAppVIPER
//
//  Created by Артем Кудрявцев on 14.06.2023.
//

import Foundation

protocol NewsDetailConfiguratorProtocol {
    func configure(with viewController: NewsDetailViewController, and news: Articles)
}
