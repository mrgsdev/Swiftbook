//
//  TabBarViewController.swift
//  ChatApp
//
//  Created by mrgsdev on 22.03.2024.
//

import UIKit

class MainTabBarController: UITabBarController {
    private let currentUser: MUser
    
    init(currentUser: MUser = MUser(username: "username",
                                    email: "email",
                                    avatarStringURL: "avatarStringURL",
                                    description: "description",
                                    sex: "sex",
                                    id: "id")) {
        self.currentUser = currentUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let peopleVC = PeopleViewController(currentUser: currentUser)
        let listVC = ListViewController(currentUser: currentUser)
        tabBar.tintColor = UIColor(hex: 0x8E5AF7)
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .white
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        let convImage = UIImage(systemName: "bubble.left.and.bubble.right", withConfiguration: boldConfig)!
        let peopleImage = UIImage(systemName: "person.2", withConfiguration: boldConfig)!
        
        viewControllers = [
            generateNavigationController(rootViewController: listVC, title: "Conversations", image: convImage),
            generateNavigationController(rootViewController: peopleVC, title: "People", image: peopleImage)
        ]
        
        // Do any additional setup after loading the view.
    }
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
import SwiftUI

struct VCCRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return MainTabBarController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct VCC_Preview: PreviewProvider {
    static var previews: some View {
        VCCRepresentable().ignoresSafeArea()
    }
}
