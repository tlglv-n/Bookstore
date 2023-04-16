//
//  TableBookViewTableViewController.swift
//  Bookstore
//
//  Created by Nurikk T. on 17.04.2023.
//

import UIKit

class TableBookView: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "First tab - row \(indexPath.row)"
        return cell
    }
}
