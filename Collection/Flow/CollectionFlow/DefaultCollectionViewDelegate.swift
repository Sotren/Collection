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
        guard let vc = UIStoryboard(name: "SelectedViewController", bundle: nil).instantiateViewController(identifier: "SelectedViewController") as? SelectedViewController else { return }
        let topvc = UIApplication.topViewController()
        let secondVcData = SecondViewController()
        print(secondVcData.fetchData)
        vc.dataFromCell = secondVcData.fetchData[indexPath.item]
        topvc?.navigationController?.pushViewController(vc, animated: true)
    }
}
