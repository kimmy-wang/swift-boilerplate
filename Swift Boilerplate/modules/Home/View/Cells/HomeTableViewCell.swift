//
//  HomeTableViewCell.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/1/30.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK:- Methods
    func setCell(title: String, author: String, description: String) {
        titleLabel.text = title
        authorLabel.text = author
        descriptionLabel.text = description
    }
    
}
