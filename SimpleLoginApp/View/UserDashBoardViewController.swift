//
//  UserDashBoardViewController.swift
//  SimpleLoginApp
//
//  Created by Prawira Hadi Fitrajaya on 21/02/24.
//

import UIKit
import SDWebImage

final class UserDashBoardViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(UserInfoViewCell.self, forCellReuseIdentifier: "UserInfoViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .singleLine
        
        return tableView
    }()
    
    var userInfoModel = [UserInfoModel]()
    
    init(userInfoModel: [UserInfoModel]) {
        super.init(nibName: nil, bundle: nil)
        
        self.userInfoModel = userInfoModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView.dataSource = self
    }
}

extension UserDashBoardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userInfoModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: UserInfoViewCell = tableView.dequeueReusableCell(withIdentifier: "UserInfoViewCell", for: indexPath) as? UserInfoViewCell {
            cell.selectionStyle = .none
            cell.configureView(model: userInfoModel[indexPath.row])
            
            return cell
        }
        
        return UITableViewCell()
    }
}
