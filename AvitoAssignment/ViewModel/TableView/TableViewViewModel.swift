//
//  TableViewViewModel.swift
//  AvitoAssignment
//
//  Created by Чистяков Василий Александрович on 07.11.2021.
//

import Foundation

class TableViewViewModel: TableViewProtocol {
    
    var employeesArray: AvitoModel!
    private var indexPath: IndexPath?
    
    func fetchData(complition: @escaping() -> Void) {
        NetworkingManager.shared.fetchData { json in
            self.employeesArray = json
            complition()
        }
    }
    
    func numberOfRows() -> Int {
        
         return employeesArray?.company.employees.count ?? 0
    }
    
    func cellForRowAt(for indexPath: IndexPath) -> String {
        
        return employeesArray.company.employees[indexPath.row].name
    }
    
    func didSelectRowAt(for indexPath: IndexPath, complition: @escaping(Employee) -> Void) {
        
        let section = employeesArray.company.employees[indexPath.row]
        complition(section)
    }
}
