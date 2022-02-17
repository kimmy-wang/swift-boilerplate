//
//  SettingsViewController.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/2/11.
//

import UIKit
import Localize_Swift
import QuickTableViewController

class SettingsViewController: QuickTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let settingsTitle = NSLocalizedString("settings", comment: "")
        let languagesTitle = NSLocalizedString("languages", comment: "")
        self.title = settingsTitle
        let displayName = Localize.displayNameForLanguage(Localize.currentLanguage())

        tableContents = [
          Section(title: "", rows: [
            SwitchRow(text: "Setting 1", switchValue: true, action: { _ in }),
            SwitchRow(text: "Setting 2", switchValue: false, action: { _ in })
          ]),

//          Section(title: "Tap Action", rows: [
//            TapActionRow(text: "Tap action", action: { [weak self] in self?.showAlert($0) })
//          ]),

          Section(title: "", rows: [
            NavigationRow(text: languagesTitle, detailText: .value1(displayName.description), icon: .named("time"), action: openAppSetting())
          ]),

          RadioSection(title: NSLocalizedString("theme", comment: ""), options: [
            OptionRow(text: NSLocalizedString("system", comment: ""), isSelected: true, action: didToggleSelection()),
            OptionRow(text: NSLocalizedString("light", comment: ""), isSelected: false, action: didToggleSelection()),
            OptionRow(text: NSLocalizedString("dark", comment: ""), isSelected: false, action: didToggleSelection())
         ])
        ]
    }

    // MARK: - Actions

    private func showAlert(_ sender: Row) {
      // ...
    }

    private func didToggleSelection() -> (Row) -> Void {
      return { [weak self] row in
        // ...
      }
    }

    private func openAppSetting() -> (Row) -> Void {
        return { _ in
            let url = URL(string: UIApplication.openSettingsURLString)!
            UIApplication.shared.open(url)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
