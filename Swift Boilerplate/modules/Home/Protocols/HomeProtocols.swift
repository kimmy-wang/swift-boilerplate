//
//  HomeProtocols.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/1/30.
//

import Foundation
import UIKit

protocol HomePresenterToViewProtocol: class {
    func showNews()
    func showError()
}

protocol HomeInteractorToPresenterProtocol: class {
    func liveNewsFetched()
    func liveNewsFetchedFailed()
}

protocol HomePresentorToInteractorProtocol: class {
    var presenter: HomeInteractorToPresenterProtocol? { get set }
    var news: [HomeModel]? { get }
    
    func fetchLiveNews()
}

protocol HomeViewToPresenterProtocol: class {
    var view: HomePresenterToViewProtocol? { get set }
    var interactor: HomePresentorToInteractorProtocol? { get set }
    var router: HomePresenterToRouterProtocol? { get set }
    
    func updateView()
    func getNewsListCount() -> Int?
    func getNews(index: Int) -> HomeModel?
}

protocol HomePresenterToRouterProtocol: class {
    static func createModule() -> UIViewController
}
