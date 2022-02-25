//
//  BaseCell.swift
//  SBTheme
//
//  Created by Ying Wang on 2022/2/25.
//

import UIKit

class BaseCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()

        theme_backgroundColor = GlobalPicker.backgroundColor
    }

}
