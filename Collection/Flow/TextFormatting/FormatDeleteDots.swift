//
//  FormatDeleteDots.swift
//  Collection
//
//  Created by Станислав Москальцов  on 28.07.2022.
//

import Foundation

class FormatDeleteDots: TextFormat {
   // var onFormatDone: ((String?) -> Void)?
    
    var onFormatDone: (String?) -> Void
        
        func textFormatting(text: String) {
            onFormatDone(text.deleteSpacing(trimText: text))
        }
        
        init(onFormatDone: @escaping (String?) -> Void) {
            self.onFormatDone = onFormatDone
       
    }
}
