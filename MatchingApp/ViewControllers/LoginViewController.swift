//
//  LoginViewController.swift
//  MatchingApp
//
//  Created by 髙野拓弥 on 2021/06/19.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: UIViews
    private let titleLabel = RegisterTitleLabel(text: "Login")
    private let emailTextField = RegisterTextField(plachHolder: "email")
    private let passwordTextField = RegisterTextField(plachHolder: "password")
    private let registerButton = RegisterButton()
    private let alreadyHaveAccountButton = UIButton(type: .system).createAboutAccountButton(text: "アカウントをお持ちでない方はこちら")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGradientLayer()
        setupLayout()
    }
    
    private func setupGradientLayer() {
        let layer = CAGradientLayer()
        let startColor = UIColor.rgb(red: 227, green: 48, blue: 78).cgColor
        let endColor = UIColor.rgb(red: 245, green: 208, blue: 108).cgColor
        
        layer.colors = [startColor, endColor]
        layer.locations = [0.0, 1.3]
        layer.frame = view.bounds
        view.layer.addSublayer(layer)
    }
    
    private func setupLayout() {
        passwordTextField.isSecureTextEntry = true
        
        let baseStackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, registerButton])
        baseStackView.axis = .vertical
        baseStackView.distribution = .fillEqually
        baseStackView.spacing = 20
        
        view.addSubview(baseStackView)
        view.addSubview(titleLabel)
        view.addSubview(alreadyHaveAccountButton)
        
        emailTextField.anchor(height: 45)
        baseStackView.anchor(left: view.leftAnchor, right: view.rightAnchor, centerY: view.centerYAnchor, leftPadding: 40, rightPadding: 40)
        titleLabel.anchor(bottom: baseStackView.topAnchor, centerX: view.centerXAnchor, bottomPadding: 20)
        alreadyHaveAccountButton.anchor(top: baseStackView.bottomAnchor, centerX: view.centerXAnchor, topPadding: 20)
    }
    
}
