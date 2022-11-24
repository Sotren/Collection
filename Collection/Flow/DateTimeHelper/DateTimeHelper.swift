//
//  DateTimeHelper.swift
//  Collection
//
//  Created by Станислав Москальцов  on 01.07.2022.
//

import Foundation


class  DateTimeHelper {
    
    func timeFormatter() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "HH:mm"
        let stringDate = dateFormatter.string(from: Date())
        return stringDate
    }
    
    func dateString(_ format: String = "yyyy-MM-dd") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: randomDate()!)
    }
    
    func randomDate() -> Date? {
        let date = Date()
        let calendar = Calendar.current
        var dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
        guard
            let days = calendar.range(of: .day, in: .month, for: date),
            let randomDay = days.randomElement()
        else {
            return nil
        }
        dateComponents.setValue(randomDay, for: .day)
        return calendar.date(from: dateComponents)
    }
}
