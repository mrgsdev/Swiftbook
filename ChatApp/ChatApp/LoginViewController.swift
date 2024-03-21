//
//  LoginViewController.swift
//  ChatApp
//
//  Created by mrgsdev on 20.03.2024.
//

import UIKit

class LoginViewController: UIViewController {
    let welcomeLabel = UILabel(text: "Welcome Back!", font: .avenir26())
    let loginWithLabel = UILabel(text: "Login with")
    let orLabel = UILabel(text: "or")
    let emailLabel = UILabel(text: "Email")
    let passwordLabel = UILabel(text: "Password")
    let needAnAccountLabel = UILabel(text: "Need an account?")
    
    let googleButton = UIButton(title: "Google", titleColor: .black, backgroundColor: .white, font: .avenir20(), isShadow: true)
    
    let emailTextField = OneLineTextField(font: .avenir20())
    let passwordTextField = OneLineTextField(font: .avenir20())
    
    let loginButton = UIButton(title: "Google", titleColor: .white, backgroundColor: .buttonDark())
     
    let signButton = UIButton(title: "Sign Up", titleColor: .buttonRed(), backgroundColor: .clear)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        googleButton.customizeGoogleButton()
        view.backgroundColor = .mainWhite()
        setupConstraints()
    }
     
}

extension LoginViewController{
    private func setupConstraints(){
        let loginWithView = ButtonFormView(label: loginWithLabel, button: googleButton)
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField],
                                         axis: .vertical,
                                         spacing: 0)
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField],
        axis: .vertical,
        spacing: 0)
        
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        let stackView = UIStackView(arrangedSubviews: [ loginWithView, orLabel, emailStackView, passwordStackView, loginButton],axis: .vertical,spacing: 40)
        
        signButton.contentHorizontalAlignment = .leading
        let bottomStackView = UIStackView(arrangedSubviews: [needAnAccountLabel, signButton],
                                          axis: .horizontal,
                                          spacing: 10)
        bottomStackView.alignment = .firstBaseline
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(stackView)
        view.addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            bottomStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
}

import SwiftUI

struct LoginRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return LoginViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct Login_Preview: PreviewProvider {
    static var previews: some View {
        LoginRepresentable().ignoresSafeArea()
    }
}