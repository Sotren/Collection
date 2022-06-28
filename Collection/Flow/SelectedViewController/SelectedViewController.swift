//
//  ViewController.swift
//  Collection
//
//  Created by Станислав Москальцов  on 23.06.2022.
//

import UIKit

class SelectedViewController: UIViewController {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    var dataFromCell: Entity!

    override func viewDidLoad() {
        super.viewDidLoad()
        iconImage.image = dataFromCell.icon
        dateLabel.text = dataFromCell.date
        timeLabel.text = dataFromCell.time
    }
}
