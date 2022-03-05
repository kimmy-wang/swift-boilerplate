//
//  SelectThemeCell.swift
//  SBTheme
//
//  Created by Ying Wang on 2022/2/25.
//

import UIKit

class SelectThemeCell: BaseCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var themeIcon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        title.theme_textColor = GlobalPicker.textColor
        themeIcon.theme_image = ["icon_theme_red", "icon_theme_yellow", "icon_theme_blue", "icon_theme_light"]
    }

}
