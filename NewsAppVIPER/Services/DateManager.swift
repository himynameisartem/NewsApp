//
//  DateManager.swift
//  NewsAppVIPER
//
//  Created by Артем Кудрявцев on 14.06.2023.
//

import Foundation

class DateManager {
    
    static let shared = DateManager()
    
    private var dateFormatter = DateFormatter()
    private var outputDateFormater = DateFormatter()
    
    func dateFromString(with date: String?) -> String? {
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        outputDateFormater.dateFormat = "dd.MM.YYYY"
        if let date = dateFormatter.date(from: date ?? "") {
            let dateString = outputDateFormater.string(from: date)
            return dateString
        } else {
            return nil
        }
    }
    
}
