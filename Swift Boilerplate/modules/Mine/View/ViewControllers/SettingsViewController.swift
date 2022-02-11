//
//  SettingsViewController.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/2/11.
//

import UIKit
import QuickTableViewController

class SettingsViewController: QuickTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Settings"
        
        tableContents = [
          Section(title: "Switch", rows: [
            SwitchRow(text: "Setting 1", switchValue: true, action: { _ in }),
            SwitchRow(text: "Setting 2", switchValue: false, action: { _ in })
          ]),

          Section(title: "Tap Action", rows: [
            TapActionRow(text: "Tap action", action: { [weak self] in self?.showAlert($0) })
          ]),

          Section(title: "Navigation", rows: [
            NavigationRow(text: "CellStyle.default", detailText: .none, icon: .named("gear")),
            NavigationRow(text: "CellStyle", detailText: .subtitle(".subtitle"), icon: .named("globe")),
            NavigationRow(text: "CellStyle", detailText: .value1(".value1"), icon: .named("time"), action: { _ in }),
            NavigationRow(text: "CellStyle", detailText: .value2(".value2"))
          ], footer: "UITableViewCellStyle.Value2 hides the image view."),

          RadioSection(title: "Radio Buttons", options: [
            OptionRow(text: "Option 1", isSelected: true, action: didToggleSelection()),
            OptionRow(text: "Option 2", isSelected: false, action: didToggleSelection()),
            OptionRow(text: "Option 3", isSelected: false, action: didToggleSelection())
          ], footer: "See RadioSection for more details.")
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
