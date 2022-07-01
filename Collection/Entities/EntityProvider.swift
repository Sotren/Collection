//
//  EntityProvider.swift
//  Collection
//
//  Created by Станислав Москальцов  on 22.06.2022.
//

import Foundation

class EntityProvider {

    static func get() -> [Entity] {
        let dataTimeHelper = DateTimeHelper()
        return [
            Entity(date: dataTimeHelper.dateString() , time: dataTimeHelper.timeFormatter() ,icon: #imageLiteral(resourceName: "banana")),
            Entity(date: dataTimeHelper.dateString() , time: dataTimeHelper.timeFormatter() ,icon: #imageLiteral(resourceName: "grapes")),
            Entity(date: dataTimeHelper.dateString() , time: dataTimeHelper.timeFormatter() ,icon: #imageLiteral(resourceName: "apple")),
            Entity(date: dataTimeHelper.dateString() , time: dataTimeHelper.timeFormatter() ,icon: #imageLiteral(resourceName: "banana")),
            Entity(date: dataTimeHelper.dateString() , time: dataTimeHelper.timeFormatter() ,icon: #imageLiteral(resourceName: "grapes")),
            Entity(date: dataTimeHelper.dateString() , time: dataTimeHelper.timeFormatter() ,icon: #imageLiteral(resourceName: "apple")),
            Entity(date: dataTimeHelper.dateString() , time: dataTimeHelper.timeFormatter() ,icon: #imageLiteral(resourceName: "pears")),
            Entity(date: dataTimeHelper.dateString() , time: dataTimeHelper.timeFormatter() ,icon: #imageLiteral(resourceName: "apple")),
            Entity(date: dataTimeHelper.dateString() , time: dataTimeHelper.timeFormatter() ,icon: #imageLiteral(resourceName: "banana")),
            Entity(date: dataTimeHelper.dateString() , time: dataTimeHelper.timeFormatter() ,icon: #imageLiteral(resourceName: "pears")),
        ]
    }
}
