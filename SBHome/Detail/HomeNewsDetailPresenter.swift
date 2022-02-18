//
//  HomeNewsDetailPresenter.swift
//  SBHome
//
//  Created by Ying Wang on 2022/2/17.
//

import Foundation
import SBCommon

class HomeNewsDetailPresenter: HomeNewsDetailViewToPresenterProtocol {

    // MARK: - Properties
    weak var view: HomeNewsDetailPresenterToViewProtocol?
    var interactor: HomeNewsDetailPresentorToInteractorProtocol?
    var router: HomeNewsDetailPresenterToRouterProtocol?
    var news: BaseModel?

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
}

// MARK: - HomeNewsDetailInteractorToPresenterProtocol
extension HomeNewsDetailPresenter: HomeNewsDetailInteractorToPresenterProtocol {
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
