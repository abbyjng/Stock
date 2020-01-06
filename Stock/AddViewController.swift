//
//  AddViewController.swift
//  Stock
//
//  Created by Abigail Ng on 12/20/19.
//  Copyright © 2019 Abigail Ng. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    var item:Item = Item()
    
    var count:Int = 1
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var subtractButton: UIButton!
    
    @IBAction func subtractButtonPressed(_ sender: Any) {
        count -= 1
        countLabel.text = "\(count)"
        if count == 1 {
            subtractButton.isEnabled = false
        }
    }
    @IBAction func addButtonPressed(_ sender: Any) {
        count += 1
        countLabel.text = "\(count)"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countLabel.text = "1"

        // Do any additional setup after loading the view.
    }
    
    func createItem() {
        if (nameTextField.text! != "") {
            item.name = nameTextField.text!
        }
        item.count = count
        item.description =  descriptionTextView.text!
    
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
