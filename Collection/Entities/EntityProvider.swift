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
            Entity(date: "28-июня-2022", time: "19:50" ,icon:#imageLiteral(resourceName: "Mishka_main_logo.png.300x200_q85") ),
            Entity(date: "28-июня-2022", time: "19:50" ,icon:#imageLiteral(resourceName: "default_grid") ),
            Entity(date: "28-июня-2022", time: "19:50" ,icon:#imageLiteral(resourceName: "Mishka_main_logo.png.300x200_q85") ),
            Entity(date: "28-июня-2022", time: "19:50" ,icon:#imageLiteral(resourceName: "Mishka_main_logo.png.300x200_q85") ),
            Entity(date: "28-июня-2022", time: "19:50" ,icon:#imageLiteral(resourceName: "Mishka_main_logo.png.300x200_q85") ),
            Entity(date: "28-июня-2022", time: "19:50" ,icon:#imageLiteral(resourceName: "Mishka_main_logo.png.300x200_q85") ),
            Entity(date: "28-июня-2022", time: "19:50" ,icon:#imageLiteral(resourceName: "Mishka_main_logo.png.300x200_q85") ),
            Entity(date: "test", time: "test" ,icon:#imageLiteral(resourceName: "default_grid") ),
        ]
    }
}
