//
//  HomeNewsDetailInteractor.swift
//  SBHome
//
//  Created by Ying Wang on 2022/2/17.
//

import Foundation
import Alamofire

class HomeNewsDetailInteractor: HomeNewsDetailPresentorToInteractorProtocol {

    // MARK: - Properties
    weak var presenter: HomeNewsDetailInteractorToPresenterProtocol?
    var news: [BaseModel]?
    var count: Int = 0
    var page: Int = 1

    // MARK: - Methods
    func fetchLiveNews(_ pullToRefresh: Bool, loadMore: Bool) {
        if loadMore {
            page += 1
        }
        if pullToRefresh {
            page = 1
        }
        self.presenter?.liveNewsFetching(pullToRefresh: pullToRefresh, loadMore: loadMore)
        AF.request(Constants.URL, parameters: ["page": page, "page_size": 10]).response { response in
            if (response.response?.statusCode == 200) {
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let newsResponse = try decoder.decode(BaseResponse.self, from: data)
                    guard let count = newsResponse.count else { return }
                    self.count = count
                    guard let articles = newsResponse.articles else { return }
                    if loadMore {
                        self.news?.append(contentsOf: articles)
                    } else {
                        self.news = articles
                    }
                    self.presenter?.liveNewsFetched(pullToRefresh: pullToRefresh, loadMore: loadMore)
                } catch let error {
                    self.resetPage()
                    print(error)
                }
            } else {
                self.resetPage()
                self.presenter?.liveNewsFetchedFailed(pullToRefresh: pullToRefresh, loadMore: loadMore)
            }
        }
    }

    private func resetPage() {
        if page > 1 {
            page -= 1
        }
    }
}
