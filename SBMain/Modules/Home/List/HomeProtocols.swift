//
//  HomeProtocols.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/1/30.
//

import Foundation
import UIKit

protocol HomePresenterToViewProtocol: AnyObject {
    func showSkeleton(_ pullToRefresh: Bool, loadMore: Bool)
    func showNews(_ pullToRefresh: Bool, loadMore: Bool)
    func showError(_ pullToRefresh: Bool, loadMore: Bool)
}

protocol HomeInteractorToPresenterProtocol: AnyObject {
    func liveNewsFetching(pullToRefresh: Bool, loadMore: Bool)
    func liveNewsFetched(pullToRefresh: Bool, loadMore: Bool)
    func liveNewsFetchedFailed(pullToRefresh: Bool, loadMore: Bool)
}

protocol HomePresentorToInteractorProtocol: AnyObject {
    var presenter: HomeInteractorToPresenterProtocol? { get set }
    var news: [BaseModel]? { get }
    var count: Int { get }
    var page: Int { get }

    func fetchLiveNews(_ pullToRefresh: Bool, loadMore: Bool)
}

protocol HomeViewToPresenterProtocol: AnyObject {
    var view: HomePresenterToViewProtocol? { get set }
    var interactor: HomePresentorToInteractorProtocol? { get set }
    var router: HomePresenterToRouterProtocol? { get set }

    func updateView(pullToRefresh: Bool, loadMore: Bool)
    func getCount() -> Int?
    func getNewsListCount() -> Int?
    func getNews(index: Int) -> BaseModel?
    func showNewsDetail(forNews: BaseModel)
}

protocol HomePresenterToRouterProtocol: AnyObject {
    static func createModule() -> UIViewController

    func presentNewsDetailScreen(from view: HomePresenterToViewProtocol, forNews news: BaseModel)
}
