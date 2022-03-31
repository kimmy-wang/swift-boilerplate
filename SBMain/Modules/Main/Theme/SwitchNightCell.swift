//
//  SwitchNightCell.swift
//  SBTheme
//
//  Created by Ying Wang on 2022/2/25.
//

import UIKit
import SwiftTheme

class SwitchNightCell: BaseCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var nightIcon: UIImageView!
    @IBOutlet weak var nightSwitch: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()

        title.theme_textColor = GlobalPicker.textColor
        nightIcon.theme_image = ["icon_night_dark", "icon_night_dark", "icon_night_dark", "icon_night_light"]

        updateNightSwitch()

        NotificationCenter.default.addObserver(self, selector: #selector(updateNightSwitch), name: NSNotification.Name(rawValue: ThemeUpdateNotification), object: nil)
    }

    @IBAction func changeNight(_ sender: UISwitch) {
        MyThemes.switchNight(isToNight: sender.isOn)
    }

    @objc private func updateNightSwitch() {
        nightSwitch.isOn = MyThemes.isNight()
    }

}
