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
    var dataFromCell: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataToView()
    }
    
    func setDataToView() {
        let image = UIImage(data: dataFromCell.image!)
        iconImage.image = image
        dateLabel.text = dataFromCell.date
        timeLabel.text = dataFromCell.time
    }
}
