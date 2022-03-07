//
//  AppearenceRouter.swift
//  SBTheme
//
//  Created by Ying Wang on 2022/2/19.
//

import Foundation
import UIKit

open class AppearenceRouter {

    // MARK: - Methods

    open class func createModule() -> UIViewController {

        let storyboard = UIStoryboard(name: "SBAppearence", bundle: Bundle(for: AppearenceRouter.self))
        let vc = storyboard.instantiateViewController(withIdentifier: "sb_appearence")
        vc.title = "Appearence"

        return vc
    }

}
