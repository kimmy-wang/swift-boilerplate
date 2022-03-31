//
//  HomePresenter.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/1/30.
//

import Foundation

class HomePresenter: HomeViewToPresenterProtocol {

    // MARK: - Properties
    weak var view: HomePresenterToViewProtocol?
    var interactor: HomePresentorToInteractorProtocol?
    var router: HomePresenterToRouterProtocol?

    // MARK: - Methods
    func updateView(pullToRefresh: Bool, loadMore: Bool) {
        interactor?.fetchLiveNews(pullToRefresh, loadMore: loadMore)
    }

    func getCount() -> Int? {
        return interactor?.count
    }

    func getNewsListCount() -> Int? {
        return interactor?.news?.count
    }

    func getNews(index: Int) -> BaseModel? {
        return interactor?.news?[index]
    }

    func showNewsDetail(forNews news: BaseModel) {
        router?.presentNewsDetailScreen(from: view!, forNews: news)
    }
}

// MARK: - HomeInteractorToPresenterProtocol
extension HomePresenter: HomeInteractorToPresenterProtocol {
    func liveNewsFetching(pullToRefresh: Bool, loadMore: Bool) {
        view?.showSkeleton(pullToRefresh, loadMore: loadMore)
    }

    func liveNewsFetched(pullToRefresh: Bool, loadMore: Bool) {
        view?.showNews(pullToRefresh, loadMore: loadMore)
    }

    func liveNewsFetchedFailed(pullToRefresh: Bool, loadMore: Bool) {
        view?.showError(pullToRefresh, loadMore: loadMore)
    }
}
