//
//  BaseResponse.swift
//  Swift Boilerplate
//
//  Created by Ying Wang on 2022/1/30.
//

import Foundation

public struct BaseResponse: Codable {
    public let status: Int?
    public let source: String?
    public let sortBy: String?
    public let count: Int?
    public let articles: [BaseModel]?
}
