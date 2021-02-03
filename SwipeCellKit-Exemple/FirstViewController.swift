//
//  FirstViewController.swift
//  SwipeCellKit-Exemple
//
//  Created by João Luis Santos on 12/01/21.
//  Copyright © 2021 João Luis Santos. All rights reserved.
//

import UIKit

class FirstViewController: SwipeTableViewController {
    
    var lines: [Line] = []
    
    let realmStack = RealmStack.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! SecondViewController
        if let index = tableView.indexPathForSelectedRow {
            destination.lines.append(lines[index.row])
        }
    }
    
    override func updateModel(at index: IndexPath) {
        let line = lines[index.row]
        realmStack.update(line)
        load()
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        var textField = UITextField()
        let alert = UIAlertController(title: "", message: "Digite o nome para uma nova linha", preferredStyle: .alert)
        alert.addTextField { alertTextField in
            textField = alertTextField
        }
        alert.addAction(UIAlertAction(title: "Adicionar", style: .default, handler: { _ in
            guard let nameLine = textField.text else { return }
            let colour = UIColor.randomFlat().hexValue()
            let lineObject = self.createLineObject(nameLine, colour)
            self.realmStack.save(lineObject)
            self.load()
            self.tableView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        
        present(alert, animated: true)
    }
    
    func createLineObject(_ name: String,_ colour: String) -> Line {
        let line = Line()
        line.name = name
        line.colour = colour
        return line
    }
    
    func load() {
        self.lines = realmStack.loadLinesObject()
    }
    
}
