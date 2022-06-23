//
//  SecondViewController.swift
//  Collection
//
//  Created by Станислав Москальцов  on 17.06.2022.
//

import UIKit

class SecondViewController: UICollectionViewController  {
    
    override func awakeFromNib() {
        navigationItem.title = "Red"
    }

    private enum PresentationStyle: String, CaseIterable {
        case table
        case defaultGrid
        case customGrid
        
        var buttonImage: UIImage {
            switch self {
            case .table: return #imageLiteral(resourceName: "table")
            case .defaultGrid: return #imageLiteral(resourceName: "default_grid")
            case .customGrid: return #imageLiteral(resourceName: "custom_grid")
            }
        }
    }
    
    private var selectedStyle: PresentationStyle = .table {
        didSet { updatePresentationStyle() }
    }
    private var styleDelegates: [PresentationStyle: CollectionViewSelectableItemDelegate] = {
        let result: [PresentationStyle: CollectionViewSelectableItemDelegate] = [
            .table: TabledContentCollectionViewDelegate(),
            .defaultGrid: DefaultGriddedContentCollectionViewDelegate(),
            .customGrid: CustomGriddedContentCollectionViewDelegate(),
        ]
        result.values.forEach {
            $0.didSelectItem = { _ in
                print("Item selected")
                // Мб тут как-то сделать 
            }
    }
        return result
    }()
    private var datasource: [Entity] = EntityProvider.get()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(CollectionViewCell.nib,
                                     forCellWithReuseIdentifier: CollectionViewCell.reuseID)
        collectionView.contentInset = .zero
        updatePresentationStyle()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: selectedStyle.buttonImage, style: .plain, target: self, action: #selector(changeContentLayout))
    }
    
    private func updatePresentationStyle() {
        collectionView.delegate = styleDelegates[selectedStyle]
        collectionView.performBatchUpdates({
            collectionView.reloadData()
        }, completion: nil)
        navigationItem.rightBarButtonItem?.image = selectedStyle.buttonImage
    }
    
    @objc private func changeContentLayout() {
        let allCases = PresentationStyle.allCases
        guard let index = allCases.firstIndex(of: selectedStyle) else { return }
        let nextIndex = (index + 1) % allCases.count
        selectedStyle = allCases[nextIndex]
    }
    
    private func pushToSelectedVc(selectedCell: Entity) {
        let storyboard = UIStoryboard(name: "ViewController", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "ViewControllerID") as? ViewController else {
            return
        }
        vc.dataFromCell = selectedCell
        navigationController?.pushViewController(vc, animated: true)
    }
}
// MARK: UICollectionViewDataSource & UICollectionViewDelegate
extension SecondViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseID,
                                                            for: indexPath) as? CollectionViewCell else {
            fatalError("Wrong cell")
        }
        let collection = datasource[indexPath.item]
        cell.update(title: collection.date)
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pushToSelectedVc(selectedCell: datasource[indexPath.row])
        
    }
}

