//
//  SettingsProtocols.swift
//  SBMine
//
//  Created by Ying Wang on 2022/2/19.
//

import Foundation
import UIKit

protocol SettingsPresenterToViewProtocol: AnyObject {}

protocol SettingsInteractorToPresenterProtocol: AnyObject {}

protocol SettingsViewToPresenterProtocol: AnyObject {
    var view: SettingsPresenterToViewProtocol? { get set }
    var router: SettingsPresenterToRouterProtocol? { get set }

    func showAppearenceDetail()
}

protocol SettingsPresenterToRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func presentAppearenceScreen(from view: SettingsPresenterToViewProtocol)
}
