//
//  NewsDetailInteractorProtocol.swift
//  NewsAppVIPER
//
//  Created by Артем Кудрявцев on 14.06.2023.
//

import Foundation

protocol NewsDetailInteractorProtocol: AnyObject {
    func provideNewsDetail()
}

protocol NewsDetailInteractorOutputProtocol: AnyObject {
    func recieveNewDetail(with newsDetailData: NewsDetailData)
}
