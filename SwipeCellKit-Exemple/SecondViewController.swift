//
//  SecondViewController.swift
//  SwipeCellKit-Exemple
//
//  Created by João Luis Santos on 18/01/21.
//  Copyright © 2021 João Luis Santos. All rights reserved.
//

import UIKit

class SecondViewController: SwipeTableViewController {
    
    var lines: [Line] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lines.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        let line = lines[indexPath.row]
        cell.textLabel?.text = line.name
        cell.backgroundColor = UIColor(hexString: line.colour)
        return cell
    }
    
    override func updateModel(at index: IndexPath) {
        lines.remove(at: index.row)
    }

}
