//
//  ViewController.swift
//  AvitoAssignment
//
//  Created by Чистяков Василий Александрович on 05.09.2021.
//

import UIKit

class EmployeesViewController: UIViewController {
    
    var employee: Employee!
    var emploeses: EmployeesProtocol! {
        didSet {
            nameLabel.text = emploeses.name
            phoneLabel.text = emploeses.phone
            skillsLabel.text = "\(employee.skills)"
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var skillsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emploeses = Employees(employee: employee)
    }
}
