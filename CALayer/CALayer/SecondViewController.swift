//
//  SecondViewController.swift
//  CALayer
//
//  Created by mrgsdev on 11.03.2024.
//

import UIKit

class SecondViewController: UIViewController {

    private var gradientLayer: CAGradientLayer! {
        didSet{
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
            let startColor = UIColor.red.cgColor;
            let endColor = UIColor.white.cgColor
            gradientLayer.colors = [startColor,endColor]
            gradientLayer.locations = [0.1,1,0.5,1]
        }
    }
    
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet{
            imageView.layer.cornerRadius = imageView.frame.size.height / 2
            imageView.layer.masksToBounds = true
            imageView.layer.borderWidth = 4
            imageView.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.layer.cornerRadius = 15
            button.layer.shadowOffset = CGSize(width: 0, height: 5)
            button.layer.shadowOpacity = 0.5
        }
    }
    
    override func viewDidLayoutSubviews() {
        let viewBounds = self.view.bounds
        gradientLayer.frame = CGRect(x: 0, y: 0, width: viewBounds.width, height: viewBounds.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0) 
    }

}
