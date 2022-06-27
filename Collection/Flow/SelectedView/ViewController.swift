//
//  ViewController.swift
//  Collection
//
//  Created by Станислав Москальцов  on 23.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    var dataFromCell: Entity!
    override func viewDidLoad() {
        super.viewDidLoad()
        dataLabel.text = dataFromCell.date
    
    }
}
