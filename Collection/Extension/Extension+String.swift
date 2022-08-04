//
//  Extension+String.swift
//  Collection
//
//  Created by Станислав Москальцов  on 28.07.2022.
//

import Foundation

extension String {
    
    func deleteSpacing(trimText: String) -> String  {
        return trimText.filter({$0 != " "})
        
    }
    
    func deleteDots(trimText: String) -> String  {
       return trimText.filter({$0 != "."})
       
    }
    
    func deletePunctuations(trimText: String) -> String  {
         return trimText.filter({$0 != ","})
    }
}
