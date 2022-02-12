//
//  HomeProtocols.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/1/30.
//

import Foundation
import UIKit

protocol HomePresenterToViewProtocol: AnyObject {
    func showSkeleton(_ pullToRefresh: Bool)
    func showNews(_ pullToRefresh: Bool)
    func showError(_ pullToRefresh: Bool)
}

protocol HomeInteractorToPresenterProtocol: AnyObject {
    func liveNewsFetching(pullToRefresh: Bool)
    func liveNewsFetched(pullToRefresh: Bool)
    func liveNewsFetchedFailed(pullToRefresh: Bool)
}

protocol HomePresentorToInteractorProtocol: AnyObject {
    var presenter: HomeInteractorToPresenterProtocol? { get set }
    var news: [HomeModel]? { get }

    func fetchLiveNews(_ pullToRefresh: Bool)
}

protocol HomeViewToPresenterProtocol: AnyObject {
    var view: HomePresenterToViewProtocol? { get set }
    var interactor: HomePresentorToInteractorProtocol? { get set }
    var router: HomePresenterToRouterProtocol? { get set }

    func updateView(pullToRefresh: Bool)
    func getNewsListCount() -> Int?
    func getNews(index: Int) -> HomeModel?
}

protocol HomePresenterToRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}
