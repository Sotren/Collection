//
//  CustomProgressView.swift
//  Collection
//
//  Created by Станислав Москальцов  on 26.07.2022.
//

import UIKit

@IBDesignable class CustomProgressView: UIProgressView {
  
    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    
    @IBInspectable public var hightScale: CGFloat = 5 {
        didSet {
            transform = transform.scaledBy(x: 1, y:hightScale)
        }
    }
}
