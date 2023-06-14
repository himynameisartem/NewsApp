//
//  NewsListViewController.swift
//  NewsAppVIPER
//
//  Created by Артем Кудрявцев on 07.06.2023.
//

import UIKit

class NewsListViewController: UIViewController {

    @IBOutlet var newsListTableView: UITableView!
    let selfToNewsDetailSegueName = "ShowDetail"
    
    var presenter: NewsListPresenterProtocol!
    private let configurator: NewsListConfiguratorProtocol = NewsListCofigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsListTableView.register(UINib(nibName: "NewsListCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        configurator.configure(with: self)
        presenter.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == selfToNewsDetailSegueName {
            guard let news = sender as? Articles else { return }
            let NewsDatailViewController = segue.destination as! NewsDetailViewController
            let configurator: NewsDetailConfiguratorProtocol = NewsDetailConfigurator()
            configurator.configure(with: NewsDatailViewController, and: news)
        }
    }
    
}

extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.newsCount ?? 0
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsListCell
        
        guard let news = presenter.news(atIndex: indexPath) else { return cell }
        
        cell.configure(news: news)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.showNewsDetails(for: indexPath)
    }
}

extension NewsListViewController: NewsListViewProtocol {
    func reloadData() {
        DispatchQueue.main.async {
            self.newsListTableView.reloadData()
        }
    }
}
