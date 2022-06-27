//
//  DefaultCollectionViewDelegate.swift
//  CustomCollectionLayout
//
//Created by Станислав Москальцов  on 22.06.2022.
//

import UIKit

protocol CollectionViewSelectableItemDelegate: class, UICollectionViewDelegateFlowLayout {
    var didSelectItem: ((_ indexPath: IndexPath) -> Void)? { get set }
}

class DefaultCollectionViewDelegate: NSObject, CollectionViewSelectableItemDelegate {
    var didSelectItem: ((_ indexPath: IndexPath) -> Void)?
    let sectionInsets = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 20.0, right: 16.0)
  
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "SelectedView", bundle: nil)
        let test = UIStoryboard(name: "Main", bundle: nil)
        guard let vc1 = test.instantiateViewController(identifier: "SecondViewControllerID") as? SecondViewController else {
            return}
        guard let vc = storyboard.instantiateViewController(identifier: "ViewControllerID") as? ViewController else {
            return
        }
        vc1.navigationController?.pushViewController(vc, animated: true)
    }
}
