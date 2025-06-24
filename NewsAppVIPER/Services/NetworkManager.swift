//
//  NetworkManager.swift
//  NewsAppVIPER
//
//  Created by Артем Кудрявцев on 07.06.2023.
//

import UIKit
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let url = "https://newsapi.org/v2/everything?q=football&apiKey=cde9b0cd48c947d2b6d955d2bff69733"
    
    func fetchNews(complition: @escaping (Result<[Articles], Error>)-> Void) {
        AF.request(url).response { responce in
            switch responce.result {
            case .success(let data) :
                do {
                    let news = try JSONDecoder().decode(News.self, from: data!)
                    complition(.success(news.articles))
                } catch {
                    complition(.failure(error))
                }
            case .failure(let error):
                complition(.failure(error))
            }
        }
    }
    
}
