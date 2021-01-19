//
//  SecondViewController.swift
//  SwipeCellKit-Exemple
//
//  Created by João Luis Santos on 18/01/21.
//  Copyright © 2021 João Luis Santos. All rights reserved.
//

import UIKit

class SecondViewController: SwipeTableViewController {
    
    var data = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    override func updateModel(at index: IndexPath) {
        data.remove(at: index.row)
    }

}
