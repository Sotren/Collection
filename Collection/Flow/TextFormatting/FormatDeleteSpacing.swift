//
//  FormatDeleteSpacing.swift
//  Collection
//
//  Created by Станислав Москальцов  on 28.07.2022.
//

import Foundation

class FormatDeleteSpacing: TextFormat {
   // var onFormatDone: ((String?) -> Void)?
    
    var onFormatDone: (String?) -> Void
        
        func textFormatting(text: String) {
            //onFormatDone(text.deleteSpacing(trimText: text))
           // onFormatDone = { (string: String?) in text.deleteSpacing(trimText: text) }
            let  test =  text.filter({$0 != " "})
            onFormatDone(test)
        }
    init(onFormatDone:  @escaping (String?) -> Void) {
            self.onFormatDone = onFormatDone
    }
}
