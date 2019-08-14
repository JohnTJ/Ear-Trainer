//
//  HomeTableViewCell.swift
//  Ear Trainer
//
//  Created by John Jones on 8/3/19.
//  Copyright © 2019 John Jones. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(title: String, description: String) {
        self.titleLabel.text = title
        self.descriptionLabel.text = description
    }
}
