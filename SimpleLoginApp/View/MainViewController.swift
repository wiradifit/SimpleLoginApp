//
//  MainViewController.swift
//  SimpleLoginApp
//
//  Created by Prawira Hadi Fitrajaya on 21/02/24.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    var contentStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10.0
        
        return stackView
    }()
    
    var emailLabel = {
        let label = UILabel()
        label.text = "Masukan Email Anda"
        label.textAlignment = .center
        
        return label
    }()
    
    var emailTextField = {
        let textField = UITextField()
        textField.keyboardType = .emailAddress
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.textAlignment = .center
        
        return textField
    }()
    
    var passwordLabel = {
        let label = UILabel()
        label.text = "Masukan Password Anda"
        label.textAlignment = .center
        
        return label
    }()
    
    var passwordTextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.textAlignment = .center
        
        return textField
    }()
    
    var submitButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 6.0
        
        return button
    }()
    
    var viewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(contentStackView)
        view.addSubview(submitButton)
        contentStackView.addArrangedSubview(emailLabel)
        contentStackView.addArrangedSubview(emailTextField)
        contentStackView.addArrangedSubview(passwordLabel)
        contentStackView.addArrangedSubview(passwordTextField)
        
        contentStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.right.equalToSuperview().inset(20.0)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(40.0)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(40.0)
        }
        
        submitButton.snp.makeConstraints { make in
            make.top.equalTo(contentStackView.snp.bottom).offset(15.0)
            make.centerX.equalToSuperview()
            make.width.equalTo(100.0)
            make.height.equalTo(50.0)
        }
        
        viewModel.actionDelegate = self
        submitButton.addTarget(self, action: #selector(onSubmitButton), for: .touchUpInside)
    }
    
    @objc
    private func onSubmitButton() {
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            viewModel.loggedIn(email: email, password: password)
        }
    }
}

extension MainViewController: MainViewModelActionDelegate {
    func moveToUserDashBoard(model: [UserInfoModel]) {
        let vc = UserDashBoardViewController(userInfoModel: model)
        navigationController?.pushViewController(vc, animated: true)
    }
}
