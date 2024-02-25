//
//  NewPlaceViewController.swift
//  MyPlaces
//
//  Created by mrgsdev on 25.02.2024.
//

import UIKit

class NewPlaceViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableView.tableFooterView = nil
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { 0 }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat { 0 }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
        } else {
            view.endEditing(true)
        }
    }
    
}


extension NewPlaceViewController: UITextFieldDelegate {
    
    // Hide Keyboard return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

