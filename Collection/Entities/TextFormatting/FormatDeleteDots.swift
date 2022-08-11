//
//  FormatDeleteDots.swift
//  Collection
//
//  Created by Станислав Москальцов  on 28.07.2022.
//

import Foundation

class FormatDeleteDots: TextFormatter {
    var onFormatDone: (String?) -> Void
    
    func format(text: String) {
        onFormatDone(text.deleteDots(trimText: text))
    }
    
    init(onFormatDone: @escaping (String?) -> Void) {
        self.onFormatDone = onFormatDone
    }
}
