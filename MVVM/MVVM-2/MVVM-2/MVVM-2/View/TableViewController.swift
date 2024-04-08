//
//  TableViewController.swift
//  MVVM-2
//
//  Created by mrgsdev on 08.04.2024.
//

import UIKit

class TableViewController: UITableViewController { 
    
    var viewModel: TableViewViewModelType? = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()  
    }

    // MARK: - Table view data source
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let viewModel else { return 0 }
        return  viewModel.numberOfRows
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        
        guard let viewModel, let cell else { return UITableViewCell()}
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        cell.viewModel = cellViewModel
        return cell
    }
 


}
