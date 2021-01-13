//
//  ViewController.swift
//  SwipeCellKit-Exemple
//
//  Created by João Luis Santos on 12/01/21.
//  Copyright © 2021 João Luis Santos. All rights reserved.
//

import UIKit
import SwipeCellKit

class ViewController: UITableViewController {
    
    var data = ["Swipe", "Cell", "Kit", "Exemple"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
    }

}

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SwipeTableViewCell
        cell.textLabel?.text = data[indexPath.row]
        
        cell.delegate = self
        
        return cell
    }
}

extension ViewController: SwipeTableViewCellDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Apagar") { action, indexPath in
            self.data.remove(at: indexPath.row)
        }
        
        deleteAction.image = UIImage(named: "trash")
        
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .reveal
        return options
    }
}
