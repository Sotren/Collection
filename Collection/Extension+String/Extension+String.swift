//
//  Extension+String.swift
//  Collection
//
//  Created by Станислав Москальцов  on 29.06.2022.
//

import Foundation


extension String {
    
    func dateFormatter() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "dd-MMMM-YYYY"
        let stringDate = dateFormatter.string(from: Date())
        return stringDate
    }
    
    func timeFormatter() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "HH:mm"
        let stringDate = dateFormatter.string(from: Date())
        return stringDate
        
    }
}
