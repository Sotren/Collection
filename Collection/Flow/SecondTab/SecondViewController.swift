//
//  SecondViewController.swift
//  Collection
//
//  Created by Станислав Москальцов  on 17.06.2022.
//

import UIKit
import CoreData

class SecondViewController: UICollectionViewController {
    
    override func awakeFromNib() {
        navigationItem.title = "Collection"
    }
    var context = CoreDataManager.shared.persistentContainer.viewContext
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
        didSet {
            updatePresentationStyle()
        }
    }
    private var styleDelegates: [PresentationStyle: CollectionViewSelectableItemDelegate] = {
        let result: [PresentationStyle: CollectionViewSelectableItemDelegate] = [
            .table: TabledContentCollectionViewDelegate(),
            .defaultGrid: DefaultGriddedContentCollectionViewDelegate(),
            .customGrid: CustomGriddedContentCollectionViewDelegate(),
        ]
        return result
    }()
    var fetchData: [Item]  {
        let itemsFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        do {
            let fetchedItems = try context.fetch(itemsFetch) as! [Item]
            return fetchedItems
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
    }
    
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
}
// MARK: UICollectionViewDataSource & UICollectionViewDelegate
extension SecondViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseID,
                                                            for: indexPath) as? CollectionViewCell else {
            fatalError("Wrong cell")
        }
        let collection = fetchData[indexPath.item]
        cell.update(time: collection.time!, image: collection.image!, date: collection.date!)
        return cell
    }
}
