//
//  HomeProtocols.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/1/30.
//

import Foundation
import UIKit

protocol HomePresenterToViewProtocol: AnyObject {
    func showSkeleton()
    func showNews()
    func showError()
}

protocol HomeInteractorToPresenterProtocol: AnyObject {
    func liveNewsFetching()
    func liveNewsFetched()
    func liveNewsFetchedFailed()
}

protocol HomePresentorToInteractorProtocol: AnyObject {
    var presenter: HomeInteractorToPresenterProtocol? { get set }
    var news: [HomeModel]? { get }
    
    func fetchLiveNews()
}

protocol HomeViewToPresenterProtocol: AnyObject {
    var view: HomePresenterToViewProtocol? { get set }
    var interactor: HomePresentorToInteractorProtocol? { get set }
    var router: HomePresenterToRouterProtocol? { get set }
    
    func updateView()
    func getNewsListCount() -> Int?
    func getNews(index: Int) -> HomeModel?
}

protocol HomePresenterToRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}
