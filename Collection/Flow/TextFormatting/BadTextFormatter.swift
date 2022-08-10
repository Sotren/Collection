//
//  BadTextFormatter.swift
//  Collection
//
//  Created by Станислав Москальцов  on 10.08.2022.
//

import Foundation

class BadTextFormatter : TextFormat {
    var onFormatDone: (String?) -> Void
    
    func textFormatting(text: String) {
        onFormatDone(text.giveUserNil(trimText: text))
    }
    
    init(onFormatDone:  @escaping (String?) -> Void) {
        self.onFormatDone = onFormatDone
    }
}
