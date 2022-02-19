//
//  AppearenceProtocols.swift
//  SBTheme
//
//  Created by Ying Wang on 2022/2/19.
//

import Foundation
import UIKit

protocol AppearencePresenterToViewProtocol: AnyObject {}

protocol AppearenceInteractorToPresenterProtocol: AnyObject {}

protocol AppearenceViewToPresenterProtocol: AnyObject {
    var view: AppearencePresenterToViewProtocol? { get set }
    var router: AppearencePresenterToRouterProtocol? { get set }
}

protocol AppearencePresenterToRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}
