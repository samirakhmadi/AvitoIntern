//
//  TableViewController.swift
//  AvitoAssignment
//
//  Created by Чистяков Василий Александрович on 29.08.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    private var tableViewViewModel: TableViewProtocol! {
        didSet {
            tableViewViewModel.fetchData {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewViewModel = TableViewViewModel()
    
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewViewModel.numberOfRows()
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = tableViewViewModel.cellForRowAt(for: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var section: Employee!
        tableViewViewModel.didSelectRowAt(for: indexPath) { employeeSection in
            section = employeeSection
        }
        
        let alert = UIAlertController(title: section.phone_number, message: section.skills.description, preferredStyle: .actionSheet)
        let profileAction = UIAlertAction(title: "Профиль", style: .default) { (alert) in
            self.performSegue(withIdentifier: "EmployeeVc", sender: indexPath)
        }
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in }
        alert.addAction(okAction)
        alert.addAction(profileAction)
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmployeeVc" {
            let vc = segue.destination as! EmployeesViewController
            let indexPath = sender as! IndexPath
            
            var employee: Employee!
            tableViewViewModel.didSelectRowAt(for: indexPath) { employeeSection in
                employee = employeeSection
            }
            vc.employee = employee
        }
    }
}
