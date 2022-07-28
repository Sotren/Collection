//
//  FormatDeleteSpacing.swift
//  Collection
//
//  Created by Станислав Москальцов  on 28.07.2022.
//

import Foundation

class FormatDeleteSpacing: textFormat {
    
    func textFormatting(text: String) -> String {
        return text.deleteSpacing(trimText: text)
    }
}
