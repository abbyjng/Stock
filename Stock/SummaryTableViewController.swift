//
//  SummaryTableViewController.swift
//  Stock
//
//  Created by Abigail Ng on 10/17/19.
//  Copyright © 2019 Abigail Ng. All rights reserved.
//

import UIKit
import Firebase

class SummaryTableViewController: UITableViewController {
    
    var items: [Item] = []

    @IBOutlet var SectionTitle: UINavigationItem!
    var sectionTitle: String = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SectionTitle.title = sectionTitle

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
            return items.count
        } else {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        let item = items[indexPath.row]
        
        cell.textLabel?.text = "\(item.name)"
        cell.detailTextLabel?.text = "\(item.count)"

        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? DetailViewController,
            let index = tableView.indexPathForSelectedRow?.row
        {
            detailViewController.item = items[index]
            
        }
    }
    
    @IBAction func unwindFromDetail(_ sender: UIStoryboardSegue) {
        if sender.source is DetailViewController {
            if let senderVC = sender.source as? DetailViewController,
                let index = tableView.indexPathForSelectedRow?.row {
                items[index] = senderVC.item
            }
            tableView.reloadData()
        }
    }
    
    @IBAction func unwindFromAdd(_ sender: UIStoryboardSegue) {
        if sender.source is AddViewController {
            if let senderVC = sender.source as? AddViewController {
                senderVC.createItem()
                items.append(senderVC.item)
            }
            tableView.reloadData()
        }
    }
    
    @IBAction func unwindFromCancel(_ sender: UIStoryboardSegue) {
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 
    @IBAction func addButtonPressed(_ sender: Any) {
        items.append(Item(name: "new item!", count: 1, description: "the details"))
        tableView.reloadData()
    }
    
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
    
    @IBAction func add(_ unwindSegue: UIStoryboardSegue) {
        if let detailViewController = unwindSegue.source as? DetailViewController {
            items.append(detailViewController.item)
        }
    }

}
