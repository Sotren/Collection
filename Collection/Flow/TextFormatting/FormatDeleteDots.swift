//
//  FormatDeleteDots.swift
//  Collection
//
//  Created by Станислав Москальцов  on 28.07.2022.
//

import Foundation

class FormatDeleteDots: textFormat {
    
    func textFormatting(text: String) -> String {
        return text.deleteDots(trimText: text)
    }
}
