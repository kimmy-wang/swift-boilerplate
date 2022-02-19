//
//  AppearencePresenter.swift
//  SBTheme
//
//  Created by Ying Wang on 2022/2/19.
//

import Foundation

class AppearencePresenter: AppearenceViewToPresenterProtocol {

    // MARK: - Properties
    weak var view: AppearencePresenterToViewProtocol?
    var router: AppearencePresenterToRouterProtocol?

    // MARK: - Methods
}

// MARK: - AppearenceInteractorToPresenterProtocol
extension AppearencePresenter: AppearenceInteractorToPresenterProtocol {}
