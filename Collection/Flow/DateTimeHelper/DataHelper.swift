//
//  DataHelper.swift
//  Collection
//
//  Created by Станислав Москальцов  on 06.07.2022.
//

import Foundation
import UIKit


class DataBaseHelper {
    static let shareInstance = DataBaseHelper()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveImage(data: Data) {
        let imageInstance = Item(context: context)
        imageInstance.image = data
        do {
            try context.save()
            print("Image is saved")
        } catch {
            print(error.localizedDescription)
        }
    }
}
