//
//  TextFormatter.swift
//  Collection
//
//  Created by Станислав Москальцов  on 11.08.2022.
//

import Foundation

protocol TextFormatter {
    func format(text: String)
    var onFormatDone: (String?) -> Void {get}
}
