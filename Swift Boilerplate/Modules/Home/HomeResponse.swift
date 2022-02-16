//
//  HomeResponse.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/1/30.
//

import Foundation

struct HomeResponse: Codable {
    let status: Int?
    let source: String?
    let sortBy: String?
    let count: Int?
    let articles: [HomeModel]?
}
