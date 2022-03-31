//
//  HomeNewsDetailProtocols.swift
//  SBHome
//
//  Created by Ying Wang on 2022/2/17.
//

import Foundation
import UIKit

protocol HomeNewsDetailPresenterToViewProtocol: AnyObject {
    func showSkeleton(_ pullToRefresh: Bool, loadMore: Bool)
    func showNews(_ pullToRefresh: Bool, loadMore: Bool)
    func showError(_ pullToRefresh: Bool, loadMore: Bool)
}

protocol HomeNewsDetailInteractorToPresenterProtocol: AnyObject {
    func liveNewsFetching(pullToRefresh: Bool, loadMore: Bool)
    func liveNewsFetched(pullToRefresh: Bool, loadMore: Bool)
    func liveNewsFetchedFailed(pullToRefresh: Bool, loadMore: Bool)
}

protocol HomeNewsDetailPresentorToInteractorProtocol: AnyObject {
    var presenter: HomeNewsDetailInteractorToPresenterProtocol? { get set }
    var news: [BaseModel]? { get }
    var count: Int { get }
    var page: Int { get }

    func fetchLiveNews(_ pullToRefresh: Bool, loadMore: Bool)
}

protocol HomeNewsDetailViewToPresenterProtocol: AnyObject {
    var view: HomeNewsDetailPresenterToViewProtocol? { get set }
    var interactor: HomeNewsDetailPresentorToInteractorProtocol? { get set }
    var router: HomeNewsDetailPresenterToRouterProtocol? { get set }
    var news: BaseModel? { get set }

    func updateView(pullToRefresh: Bool, loadMore: Bool)
    func getCount() -> Int?
    func getNewsListCount() -> Int?
    func getNews(index: Int) -> BaseModel?
}

protocol HomeNewsDetailPresenterToRouterProtocol: AnyObject {
    static func createModule(forNews news: BaseModel) -> UIViewController
}
