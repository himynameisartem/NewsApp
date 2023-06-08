//
//  NewsListInteractorProtocol.swift
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
}
