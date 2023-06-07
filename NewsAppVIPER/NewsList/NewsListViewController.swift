//
//  NewsListViewController.swift
//  NewsAppVIPER
//
//  Created by Артем Кудрявцев on 07.06.2023.
//

import UIKit

class NewsListViewController: UIViewController {

    @IBOutlet var newsListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsListTableView.register(UINib(nibName: "NewsListCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }


}

extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsListCell
        
        return cell
    }
    
    
}
