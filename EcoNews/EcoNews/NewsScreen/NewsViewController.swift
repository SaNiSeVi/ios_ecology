//
//  NewsViewController.swift
//  EcoNews
//
//  Created by Никита Ткаченко on 31.12.2020.
//

import UIKit

class NewsViewController: UIViewController {

    var categories = PartsOfNews.allNews
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories[section].news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let news = categories[indexPath.section].news[indexPath.row]
        cell.textLabel?.text = news.title
        cell.detailTextLabel?.text = news.info
        // Количество строк не ограничено в описании новости
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section].title
    }
    
    
}
