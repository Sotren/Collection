//
//  BadTextFormatter.swift
//  Collection
//
//  Created by Станислав Москальцов  on 10.08.2022.
//

import Foundation

class BadTextFormatter: TextFormatter {
    var onFormatDone: (String?) -> Void
    
    func format(text: String) {
        onFormatDone(nil)
    }
    
    init(onFormatDone:  @escaping (String?) -> Void) {
        self.onFormatDone = onFormatDone
    }
}
