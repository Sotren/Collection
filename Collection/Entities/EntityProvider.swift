//
//  EntityProvider.swift
//  Collection
//
//  Created by Станислав Москальцов  on 22.06.2022.
//

import Foundation

struct EntityProvider {
    
    func get() -> [Entity] {
        let date = "".dateFormatter()
        let time = "".timeFormatter()
        return [
            Entity(date: date,time: time ,icon:#imageLiteral(resourceName: "apple") ),
            Entity(date: date, time: time ,icon:#imageLiteral(resourceName: "apple") ),
            Entity(date: date,time: time ,icon:#imageLiteral(resourceName: "apple") ),
            Entity(date: date, time: time ,icon:#imageLiteral(resourceName: "apple") ),
            Entity(date: date, time: time ,icon:#imageLiteral(resourceName: "apple") ),
            Entity(date: date, time: time ,icon:#imageLiteral(resourceName: "apple") ),
            Entity(date: date, time: time ,icon:#imageLiteral(resourceName: "apple") ),
            Entity(date: date, time: time ,icon:#imageLiteral(resourceName: "apple") ),
            Entity(date: date, time: time ,icon:#imageLiteral(resourceName: "apple") ),
            Entity(date: date, time: time ,icon:#imageLiteral(resourceName: "apple") ),
        ]
    }
}
