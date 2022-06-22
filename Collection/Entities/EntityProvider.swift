//
//  EntityProvider.swift
//  Collection
//
//  Created by Станислав Москальцов  on 22.06.2022.
//

import Foundation

struct EntityProvider {
    static func get() -> [Entity] {
        return [
            Entity(date: "test", time: "test" )
        ]
    }
}
