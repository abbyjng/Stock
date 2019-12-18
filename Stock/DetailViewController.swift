//
//  DetailViewController.swift
//  Stock
//
//  Created by Abigail Ng on 10/23/19.
//  Copyright © 2019 Abigail Ng. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var countEditLabel: UILabel!
    
    @IBOutlet weak var labelView: UIStackView!
    @IBOutlet weak var editView: UIStackView!
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    @IBAction func addButton(_ sender: Any) {
        item.count += 1
        countLabel.text = "\(item.count)"
    }
    
    @IBAction func subtractButton(_ sender: Any) {
        item.count -= 1
        countLabel.text = "\(item.count)"
    }
    
    var item: Item = Item()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = item.name
        descriptionLabel.text = item.description
        countLabel.text = "\(item.count)"
        
        // Do any additional setup after loading the view.
        labelView.isHidden = false
        editView.isHidden = true
    }
    
    @IBAction func editButtonPressed(_ sender: Any) {
        if labelView.isHidden {
            nameLabel.text = nameTextField.text
            descriptionLabel.text = descriptionTextView.text
            item.name = nameLabel.text!
            item.description = descriptionLabel.text!
            item.count = Int(countLabel.text!)!
            editButton.title = "Edit"
        } else {
            nameTextField.text = nameLabel.text
            descriptionTextView.text = descriptionLabel.text
            countEditLabel.text = countLabel.text
            editButton.title = "Done"
        }
        labelView.isHidden = !labelView.isHidden
        editView.isHidden = !editView.isHidden
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
