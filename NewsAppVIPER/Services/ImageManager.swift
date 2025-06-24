//
//  ImageManager.swift
//  NewsAppVIPER
//
//  Created by Артем Кудрявцев on 08.06.2023.
//

import UIKit

class ImageManager {
    
    static let shared = ImageManager()
    private var imageLoadTasks: [URLSessionDataTask] = []
    
    func loadImageFromURL(urlString: String?, completion: @escaping (Data) -> Void) {
        DispatchQueue.global().async {
            guard let urlString = urlString else { return }
            if let data = try? Data(contentsOf: URL(string: urlString)!) {
                DispatchQueue.main.async {
                    completion(data)
                }
            }
        }
    }
    
    func cancelImageLoading(for urlString: String) {
        if let index = imageLoadTasks.firstIndex(where: { $0.originalRequest?.url?.absoluteString == urlString }) {
            let task = imageLoadTasks[index]
            task.cancel()
            imageLoadTasks.remove(at: index)
        }
    }
}
