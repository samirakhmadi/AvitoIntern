//
//  EmployeesProtocol.swift
//  AvitoAssignment
//
//  Created by Чистяков Василий Александрович on 07.11.2021.
//

import Foundation

protocol EmployeesProtocol {
    
    var name: String { get }
    var phone: String { get }
    var skilss: [String] { get}
    
    init(employee: Employee)
}
