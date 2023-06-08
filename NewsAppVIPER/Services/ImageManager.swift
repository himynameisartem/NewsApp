//
//  ImageManager.swift
//  NewsAppVIPER
//
//  Created by Артем Кудрявцев on 08.06.2023.
//

import UIKit

class ImageManager {
    
    static let shared = ImageManager()
    
    func getImageData(from imageURL: String?) -> Data? {
        guard let stringURL = imageURL else { return nil }
        guard let imageURL = URL(string: stringURL) else { return nil }
        guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
        return imageData
    }
}
