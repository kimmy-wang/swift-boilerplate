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
    func updateView(pullToRefresh: Bool) {
        interactor?.fetchLiveNews(pullToRefresh)
    }

    func getNewsListCount() -> Int? {
        return interactor?.news?.count
    }

    func getNews(index: Int) -> HomeModel? {
        return interactor?.news?[index]
    }
}

// MARK: - HomeInteractorToPresenterProtocol
extension HomePresenter: HomeInteractorToPresenterProtocol {
    func liveNewsFetching(pullToRefresh: Bool) {
        view?.showSkeleton(pullToRefresh)
    }

    func liveNewsFetched(pullToRefresh: Bool) {
        view?.showNews(pullToRefresh)
    }

    func liveNewsFetchedFailed(pullToRefresh: Bool) {
        view?.showError(pullToRefresh)
    }
}
