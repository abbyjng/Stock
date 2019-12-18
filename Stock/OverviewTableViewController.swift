//
//  OverviewTableViewController.swift
//  Stock
//
//  Created by Abigail Ng on 10/23/19.
//  Copyright © 2019 Abigail Ng. All rights reserved.
//

import UIKit

class OverviewTableViewController: UITableViewController {

    var sections: [Section] = [Section(name: "Section1", description: "This is a test:)")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sections[0].addItem(item: Item(name: "test", count: 123, description: "this is a testing item. it has a long description so that we can see how it look when it extends very long! i am now writing more description than any item would normally have. cool."))
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return sections.count
        } else {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell", for: indexPath)

        let section = sections[indexPath.row]
        cell.textLabel?.text = "\(section.name)"
        if (section.items.count == 1) {
            cell.detailTextLabel?.text = "\(section.items.count) item"
        } else {
            cell.detailTextLabel?.text = "\(section.items.count) items"
        }

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let summaryTableViewController = segue.destination as? SummaryTableViewController,
            let index = tableView.indexPathForSelectedRow?.row
        {
            summaryTableViewController.items = sections[index].items
            summaryTableViewController.sectionTitle = sections[index].name
        }
    }
    
    @IBAction func unwindFromSummary(_ sender: UIStoryboardSegue) {
        if sender.source is SummaryTableViewController {
            if let senderVC = sender.source as? SummaryTableViewController,
                let index = tableView.indexPathForSelectedRow?.row {
                sections[index].items = senderVC.items
            }
            tableView.reloadData()
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
