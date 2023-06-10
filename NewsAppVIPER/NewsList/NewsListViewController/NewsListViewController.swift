//
//  NewsListViewController.swift
//  NewsAppVIPER
//
//  Created by Артем Кудрявцев on 07.06.2023.
//

import UIKit

class NewsListViewController: UIViewController {

    @IBOutlet var newsListTableView: UITableView!
    
    var presenter: NewsListPresenterProtocol!
    private let configurator: NewsListConfiguratorProtocol = NewsListCofigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsListTableView.register(UINib(nibName: "NewsListCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        configurator.configure(with: self)
        presenter.viewDidLoad()
    }
}

extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.newsCount ?? 0
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsListCell
        
        guard let news = presenter.news(atIndex: indexPath) else { return NewsListCell() }
        
        cell.configure(news: news)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension NewsListViewController: NewsListViewProtocol {
    func reloadData() {
        DispatchQueue.main.async {
            self.newsListTableView.reloadData()
        }
    }
}
