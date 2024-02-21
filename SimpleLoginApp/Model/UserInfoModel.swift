//
//  UserInfoModel.swift
//  SimpleLoginApp
//
//  Created by Prawira Hadi Fitrajaya on 21/02/24.
//

import Foundation

struct MainResponse: Codable {
    let page, perPage, total, totalPages: Int
    let data: [UserInfoModel]

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data
    }
}

struct UserInfoModel: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

struct LoginModel: Codable {
    let token: String
}
