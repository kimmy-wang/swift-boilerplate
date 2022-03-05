//
//  SelectThemeViewController.swift
//  SBTheme
//
//  Created by Ying Wang on 2022/3/5.
//

import UIKit

class SelectThemeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Theme"

        view.theme_backgroundColor = GlobalPicker.backgroundColor
    }

    @IBAction func tapRedClick(_ sender: UIButton) {
        MyThemes.switchTo(theme: .red)
    }

    @IBAction func tapYellowClick(_ sender: UIButton) {
        MyThemes.switchTo(theme: .yello)
    }

    @IBAction func tapBlueClick(_ sender: UIButton) {
        MyThemes.switchTo(theme: .blue)
    }
}
