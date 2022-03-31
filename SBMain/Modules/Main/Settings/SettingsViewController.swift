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

    // MARK: - Properties
    var presenter: SettingsViewToPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = NSLocalizedString("settings", comment: "")
        let displayName = Localize.displayNameForLanguage(Localize.currentLanguage())

        tableContents = [
          Section(title: "", rows: [
            SwitchRow(text: "Setting 1", switchValue: true, action: { _ in }),
            SwitchRow(text: "Setting 2", switchValue: false, action: { _ in })
          ]),

          Section(title: "", rows: [
            NavigationRow(text: NSLocalizedString("languages", comment: ""), detailText: .value1(displayName.description), icon: .named("time"), action: openAppSetting())
          ]),

          Section(title: "", rows: [
            NavigationRow(text: NSLocalizedString("dark_mode", comment: ""), detailText: .value1(""), icon: .named("time"), action: openAppearance())
          ])
        ]

//        if #available(iOS 13.0, *) {
//            tableContents.append(contentsOf: [
//                RadioSection(title: NSLocalizedString("theme", comment: ""), options: [
//                OptionRow(text: NSLocalizedString("system", comment: ""), isSelected: false, action: didToggleSelection(.unspecified)),
//                OptionRow(text: NSLocalizedString("light", comment: ""), isSelected: false, action: didToggleSelection(.light)),
//                OptionRow(text: NSLocalizedString("dark", comment: ""), isSelected: false, action: didToggleSelection(.dark))
//             ])
//            ])
//            NotificationCenter.default.addObserver(self, selector: #selector(updateNightSwitch), name: NSNotification.Name(rawValue: ThemeUpdateNotification), object: nil)
//        }

    }

    // MARK: - Actions

    @available(iOS 13.0, *)
    private func didToggleSelection(_ theme: UIUserInterfaceStyle) -> (Row) -> Void {
      return { row in
          guard let optionRow = row as? OptionRow else {
              return
          }
          if optionRow.isSelected {
//              NotificationCenter.default.post(name: Notification.Name(rawValue: ThemeUpdateNotification), object: nil, userInfo: ["theme": theme])
          }
      }
    }

    private func openAppSetting() -> (Row) -> Void {
        return { _ in
            let url = URL(string: UIApplication.openSettingsURLString)!
            UIApplication.shared.open(url)
        }
    }

    private func openAppearance() -> (Row) -> Void {
        return { _ in
            self.presenter?.showAppearenceDetail()
        }
    }

    @objc private func updateNightSwitch(notification: Notification) {
        //
        print("updateNightSwitch")
        if #available(iOS 13.0, *) {
            guard let themeDict = notification.userInfo as? [String: UIUserInterfaceStyle] else {
                return
            }
            let theme = themeDict["theme"]
            self.overrideUserInterfaceStyle = theme ?? .unspecified
        } else {
            // Fallback on earlier versions
        }
    }

}

// MARK: - SettingsPresenterToViewProtocol
extension SettingsViewController: SettingsPresenterToViewProtocol {}
