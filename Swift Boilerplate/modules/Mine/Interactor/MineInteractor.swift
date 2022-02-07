//
//  MineInteractor.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/2/6.
//

import Foundation
import Alamofire

class MineInteractor: MinePresentorToInteractorProtocol {

    // MARK: - Properties
    weak var presenter: MineInteractorToPresenterProtocol?
    var news: [HomeModel]?
    
    // MARK: - Methods
    func fetchLiveNews() {
        AF.request(Constants.MINE_URL).response { response in
            if(response.response?.statusCode == 200){
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
            }
            else {
                self.presenter?.liveNewsFetchedFailed()
            }
        }
    }
}
