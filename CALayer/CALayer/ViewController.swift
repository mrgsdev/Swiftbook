//
//  ViewController.swift
//  CALayer
//
//  Created by mrgsdev on 11.03.2024.
//

import UIKit

class ViewController: UIViewController {
    var shapeLayer: CAShapeLayer! {
        didSet {
            shapeLayer.lineWidth = 5
            shapeLayer.lineCap = .round
            shapeLayer.fillColor = nil
            shapeLayer.strokeEnd = 1
            let color = UIColor.gray.cgColor
            shapeLayer.strokeColor = color
        }
    }
    
    var overShapeLayer: CAShapeLayer! {
        didSet {
            overShapeLayer.lineWidth = 20
            overShapeLayer.lineCap = .round
            overShapeLayer.fillColor = nil
            overShapeLayer.strokeEnd = 0
            let color = UIColor.white.cgColor
            overShapeLayer.strokeColor = color
        }
    }
    var gradientLayer: CAGradientLayer! {
        didSet {
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
            let startColor = UIColor.systemPink.cgColor
            let endColor = UIColor.white.cgColor
            gradientLayer.colors = [startColor, endColor]
            gradientLayer.locations = [0.3, 0.7]
        }
    }
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.size.height / 2
            imageView.layer.masksToBounds = true
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.borderWidth = 10
        }
    }
    
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.layer.shadowOffset = CGSize(width: 0, height: 5)
            button.layer.shadowOpacity = 0.5
            button.layer.shadowRadius = 5
            button.layer.cornerRadius = 15
        }
    }
    
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.height)
        configShapeLayer(shapeLayer)
        configShapeLayer(overShapeLayer)
    }
    func configShapeLayer(_ shapeLayer: CAShapeLayer) {
        shapeLayer.frame = view.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 2))
        path.addLine(to: CGPoint(x: self.view.frame.width / 2 + 100, y: self.view.frame.height / 2))
        shapeLayer.path = path.cgPath
    }
    
    
    
    
    override func viewDidLoad() {
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer)
        
        overShapeLayer = CAShapeLayer()
        view.layer.addSublayer(overShapeLayer)
    }

    @IBAction func tapped(_ sender: UIButton) {
        
        overShapeLayer.strokeEnd += 0.2
        if overShapeLayer.strokeEnd == 1 {
            performSegue(withIdentifier: "showSecondScreen", sender: self)
        }
    }
}

