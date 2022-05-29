//
//  Employees.swift
//  AvitoAssignment
//
//  Created by Чистяков Василий Александрович on 07.11.2021.
//

import Foundation

class Employees: EmployeesProtocol {
    
    var name: String {
       return employee.name
    }
    var phone: String {
       return employee.phone_number
    }
    var skilss: [String] {
        return employee.skills
    }
    
    var employee: Employee!
    
    required init(employee: Employee) {
        self.employee = employee
    }
    
}
