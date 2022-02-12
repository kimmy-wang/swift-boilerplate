//
//  MinePresenter.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/2/6.
//

import Foundation

class MinePresenter: MineViewToPresenterProtocol {

    // MARK: - Properties
    weak var view: MinePresenterToViewProtocol?
    var interactor: MinePresentorToInteractorProtocol?
    var router: MinePresenterToRouterProtocol?

    // MARK: - Methods
    func updateView() {
        interactor?.fetchLiveNews()
    }

    func getNewsListCount() -> Int? {
        return interactor?.news?.count
    }

    func getNews(index: Int) -> HomeModel? {
        return interactor?.news?[index]
    }
}

// MARK: - HomeInteractorToPresenterProtocol
extension MinePresenter: MineInteractorToPresenterProtocol {

    func liveNewsFetched() {
        view?.showNews()
    }

    func liveNewsFetchedFailed() {
        view?.showError()
    }
}
