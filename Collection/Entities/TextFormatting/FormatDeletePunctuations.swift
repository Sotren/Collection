//
//  FormatDeletePunctuations.swift
//  Collection
//
//  Created by Станислав Москальцов  on 28.07.2022.
//

import Foundation

class FormatDeletePunctuations: TextFormatter {
    var onFormatDone: (String?) -> Void
    
    func format(text: String) {
        onFormatDone(text.deletePunctuations(trimText: text))
    }
    
    init(onFormatDone: @escaping (String?) -> Void) {
        self.onFormatDone = onFormatDone
    }
}
