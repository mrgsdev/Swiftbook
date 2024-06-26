//
//  ViewController.swift
//  ChatApp
//
//  Created by mrgsdev on 20.03.2024.
//

import UIKit

class AuthViewController: UIViewController {
    
    let logoImageView = UIImageView(image: .logo, contentMode: .scaleAspectFit)
    
    let googleLabel = UILabel(text: "Get started with")
    
    let emailLabel = UILabel(text: "or sign up with")
    
    let alreadyOnboardLabel = UILabel(text: "Already onboard")
    
    let googleButton = UIButton(title: "Google", titleColor: .black, backgroundColor: .white, font: .avenir20(), isShadow: true)
    
    let emailButton = UIButton(title: "Email", titleColor: .white, backgroundColor: .buttonDark())
    
    let loginButton = UIButton(title: "Login", titleColor: .buttonRed(), backgroundColor: .white, isShadow: true)
    
    let signUpButton = UIButton(title: "Sign Up", titleColor: .white, backgroundColor: .buttonDark(),cornerRadius: 4)
    
    let signUpVC = SignUpViewController()
    let loginVC = LoginViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        googleButton.customizeGoogleButton() 
        view.backgroundColor = .white
        setupConstraints()
        emailButton.addTarget(self, action: #selector(emailButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        loginVC.delegate = self
        signUpVC.delegate = self
    }
    
    @objc private func emailButtonTapped() {
        present(signUpVC, animated: true, completion: nil)
    }
    
    @objc private func loginButtonTapped() {
        present(loginVC, animated: true, completion: nil)
    }
    
}
//MARK: - Setup Constraints

extension AuthViewController {
    private func setupConstraints() {
        let googleView = ButtonFormView(label: googleLabel, button: googleButton)
        let emailView = ButtonFormView(label: emailLabel, button: emailButton)
        let loginView = ButtonFormView(label: alreadyOnboardLabel, button: loginButton)
        
        let stackView = UIStackView(arrangedSubviews: [googleView, emailView, loginView],
                                    axis: .vertical, spacing: 40)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 160),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
}


extension AuthViewController: AuthNavigatingDelegate{
    func toLoginVC() {
        present(loginVC, animated: true)
    }
    
    func toSignUpVC() {
        present(signUpVC, animated: true)
    }
    
    
}
// MARK: - SwiftUI Preview
import SwiftUI

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return AuthViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct ViewControllerRepresentable_Preview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable().edgesIgnoringSafeArea(.all)
    }
}
