//
//  SecondViewController.swift
//  Collection
//
//  Created by Станислав Москальцов  on 17.06.2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func awakeFromNib() {
        navigationItem.title = "Red"
    }

}
