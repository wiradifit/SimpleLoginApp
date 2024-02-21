//
//  MainViewModel.swift
//  SimpleLoginApp
//
//  Created by Prawira Hadi Fitrajaya on 21/02/24.
//

import Foundation
import Alamofire

protocol MainViewModelActionDelegate: AnyObject {
    func moveToUserDashBoard(model: [UserInfoModel])
}

class MainViewModel {
    
    weak var actionDelegate: MainViewModelActionDelegate?
    
    func loggedIn(email: String, password: String) {
        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        AF.request("https://reqres.in/api/login", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseDecodable(of: LoginModel.self) { response in
                switch response.result {
                case .success(let loginResponse):
                    
                    if loginResponse.token == "QpwL5tke4Pnpja7X4" {
                        self.loadUserInfo()
                    }
                    
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
    }
    
    private func loadUserInfo() {
        AF.request("https://reqres.in/api/users?page=2").responseDecodable(of: MainResponse.self) { response in
                switch response.result {
                case .success(let mainResponse):
                    self.actionDelegate?.moveToUserDashBoard(model: mainResponse.data)
                    
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
    }
}
