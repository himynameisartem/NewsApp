//
//  NewsListPresenterProtocol.swift
//  NewsAppVIPER
//
//  Created by Артем Кудрявцев on 08.06.2023.
//

import Foundation

protocol NewsListPresenterProtocol: AnyObject {
    var news: [Articles] { get }
    var newsCount: Int? { get }
    func viewDidLoad()
    func news(atIndex indexPath: IndexPath) -> Articles?
    func showNewsDetails(for indexPath: IndexPath)
}
