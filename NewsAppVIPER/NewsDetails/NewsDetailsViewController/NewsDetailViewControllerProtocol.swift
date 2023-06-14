//
//  NewsDetailViewControllerProtocol.swift
//  NewsAppVIPER
//
//  Created by Артем Кудрявцев on 14.06.2023.
//

import UIKit

protocol NewsDetailViewControllerProtocol {
    func setImage(with imageString: String?)
    func setDate(with date: String?)
    func setText(with text: String?)
}
