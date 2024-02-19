//
//  ViewController.swift
//  Framework-UIKit
//
//  Created by mrgsdev on 19.02.2024.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet weak var buttonClear: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
        setupButtons()
    }
    
    private func setupLabel() {
        label.isHidden = true
        label.font = UIFont.systemFont(ofSize: 35)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
    }
    
    private func setupButtons() {
        buttonClear.isHidden = !buttonClear.isHidden
        buttonClear.backgroundColor = .brown
        buttonClear.tintColor = .white
        buttonClear.layer.cornerRadius = 15
        for button in buttons {
            button.backgroundColor = .brown
            button.tintColor = .white
            button.layer.cornerRadius = 15
        }
    }

    @IBAction func pressedButton(_ sender: UIButton) {
        label.isHidden = false
        buttonClear.isHidden = false
        switch sender.tag {
        case 0:
            label.text = "Привет, мир!"
            print("Значение кнопки: \(sender.titleLabel?.text ?? "")")
        case 1:
            label.text = "Привет!"
            print("Значение кнопки: \(sender.titleLabel?.text ?? "")")
        case 2:
            label.isHidden = !label.isHidden
            buttonClear.isHidden = !buttonClear.isHidden
        default:
            break
        }
    }
}
