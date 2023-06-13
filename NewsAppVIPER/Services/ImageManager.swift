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
    
    func loadImageFromURL(urlString: String, completion: @escaping (UIImage?) -> Void) {
        if urlString != "" {
            guard let url = URL(string: urlString) else {
                completion(nil)
                return
            }
            if imageLoadTasks.first(where: { $0.originalRequest?.url?.absoluteString == urlString }) != nil {
                completion(nil)
                return
            }
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let index = self.imageLoadTasks.firstIndex(where: { $0.originalRequest?.url?.absoluteString == urlString }) {
                    self.imageLoadTasks.remove(at: index)
                }
                guard let data = data, let image = UIImage(data: data) else {
                    completion(nil)
                    return
                }
                completion(image)
            }
            imageLoadTasks.append(task)
            task.resume()
        } else {
            let image = UIImage(named: "emptyImage")
            completion(image)
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
