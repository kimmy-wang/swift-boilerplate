//
//  HomeInteractor.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/1/30.
//

import Foundation
import Alamofire

class HomeInteractor: HomePresentorToInteractorProtocol {

    // MARK: - Properties
    weak var presenter: HomeInteractorToPresenterProtocol?
    var news: [HomeModel]?

    // MARK: - Methods
    func fetchLiveNews() {
        self.presenter?.liveNewsFetching()
        AF.request(Constants.URL).response { response in
            if (response.response?.statusCode == 200) {
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let newsResponse = try decoder.decode(HomeResponse.self, from: data)
                    guard let articles = newsResponse.articles else { return }
                    self.news = articles
                    self.presenter?.liveNewsFetched()
                } catch let error {
                    print(error)
                }
            } else {
                self.presenter?.liveNewsFetchedFailed()
            }
        }
    }
}
