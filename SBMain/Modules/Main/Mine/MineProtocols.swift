//
//  MineProtocols.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/2/6.
//

import Foundation
import UIKit

protocol MinePresenterToViewProtocol: AnyObject {}

protocol MineInteractorToPresenterProtocol: AnyObject {}

protocol MineViewToPresenterProtocol: AnyObject {
    var view: MinePresenterToViewProtocol? { get set }
    var router: MinePresenterToRouterProtocol? { get set }

    func showSettingsDetail()
}

protocol MinePresenterToRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func presentSettingsScreen(from view: MinePresenterToViewProtocol)
}
