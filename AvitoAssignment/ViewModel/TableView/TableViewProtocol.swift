//
//  TableViewProtocol.swift
//  AvitoAssignment
//
//  Created by Чистяков Василий Александрович on 07.11.2021.
//

import Foundation

protocol TableViewProtocol {
    
    var employeesArray: AvitoModel! { get }
    func fetchData(complition: @escaping() -> Void)
    func numberOfRows() -> Int
    func cellForRowAt(for indexPath: IndexPath) -> String
    func didSelectRowAt(for indexPath: IndexPath, complition: @escaping(Employee) -> Void)    
}
