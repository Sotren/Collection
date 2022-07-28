//
//  FormatDeletePunctuations.swift
//  Collection
//
//  Created by Станислав Москальцов  on 28.07.2022.
//

import Foundation

class FormatDeletePunctuations: textFormat {
   
    func textFormatting(text: String) -> String {
        return text.deletePunctuations(trimText: text)
    }
}
