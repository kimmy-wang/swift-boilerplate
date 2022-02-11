//
//  MineProtocols.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/2/6.
//

import Foundation
import UIKit

protocol MinePresenterToViewProtocol: AnyObject {
    func showNews()
    func showError()
}

protocol MineInteractorToPresenterProtocol: AnyObject {
    func liveNewsFetched()
    func liveNewsFetchedFailed()
}

protocol MinePresentorToInteractorProtocol: AnyObject {
    var presenter: MineInteractorToPresenterProtocol? { get set }
    var news: [HomeModel]? { get }

    func fetchLiveNews()
}

protocol MineViewToPresenterProtocol: AnyObject {
    var view: MinePresenterToViewProtocol? { get set }
    var interactor: MinePresentorToInteractorProtocol? { get set }
    var router: MinePresenterToRouterProtocol? { get set }

    func updateView()
    func getNewsListCount() -> Int?
    func getNews(index: Int) -> HomeModel?
}

protocol MinePresenterToRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}
