//
//  CollectionViewCell.swift
//  Collection
//
//  Created by Станислав Москальцов  on 22.06.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

        static let reuseID = String(describing:  CollectionViewCell.self)
        static let nib = UINib(nibName: String(describing:  CollectionViewCell.self), bundle: nil)
        
        @IBOutlet private weak var stackView: UIStackView!
        
        @IBOutlet private weak var imageIcon: UIImageView!
        @IBOutlet private weak var dataLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
        override func awakeFromNib() {
            super.awakeFromNib()
            backgroundColor = .white
            clipsToBounds = true
            layer.cornerRadius = 4
            dataLabel.font = UIFont.systemFont(ofSize: 18)
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            updateContentStyle()
        }
        
        func update(title: String) {
            //imageIcon.image = image
            dataLabel.text = title
        }
        
        private func updateContentStyle() {
            let isHorizontalStyle = bounds.width > 2 * bounds.height
            let oldAxis = stackView.axis
            let newAxis: NSLayoutConstraint.Axis = isHorizontalStyle ? .horizontal : .vertical
            guard oldAxis != newAxis else { return }

            stackView.axis = newAxis
            stackView.spacing = isHorizontalStyle ? 16 : 4
            dataLabel.textAlignment = isHorizontalStyle ? .left : .center
            let fontTransform: CGAffineTransform = isHorizontalStyle ? .identity : CGAffineTransform(scaleX: 0.8, y: 0.8)
            
            UIView.animate(withDuration: 0.3) {
                self.dataLabel.transform = fontTransform
                self.layoutIfNeeded()
            }
        }
    }
