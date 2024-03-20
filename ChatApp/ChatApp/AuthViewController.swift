//
//  ViewController.swift
//  ChatApp
//
//  Created by mrgsdev on 20.03.2024.
//

import UIKit

class AuthViewController: UIViewController {
    
    let logoImageView = UIImageView(image:UIImage(named:  .logo.rawValue), contentMode: .scaleAspectFit)

    let googleLabel = UILabel(text: "Get started with")

    let emailLabel = UILabel(text: "or sign up with")
    
    let alreadyOnboardLabel = UILabel(text: "Already onboard")
    
    let googleButton = UIButton(title: "Google", titleColor: .black, backgroundColor: .white, font: .avenir20(), isShadow: true)
    
    let emailButton = UIButton(title: "Email", titleColor: .white, backgroundColor: .buttonDark())
    
    let loginButton = UIButton(title: "Login", titleColor: .buttonRed(), backgroundColor: .white, isShadow: true)
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainWhite()
        view.addSubview(emailButton)
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
