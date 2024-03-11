//
//  SecondViewController.swift
//  CALayer
//
//  Created by mrgsdev on 11.03.2024.
//

import UIKit

class SecondViewController: UIViewController {
    private var shapeLayer: CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = 5
        shapeLayer.lineCap = .round
        shapeLayer.fillColor = nil
        shapeLayer.strokeEnd = 1
        shapeLayer.strokeColor = UIColor.gray.cgColor
        return shapeLayer
    }()
    
    private var overShapeLayer:  CAShapeLayer = {
        let overShapeLayer = CAShapeLayer()
        overShapeLayer.lineWidth = 20
        overShapeLayer.lineCap = .square
        overShapeLayer.fillColor = nil
        overShapeLayer.strokeEnd = 0
        overShapeLayer.strokeColor = UIColor.white.cgColor
        return overShapeLayer
    }()
    
    
    func configShapeLayer() {
        shapeLayer.frame = imageView.bounds
        let path = UIBezierPath(ovalIn: CGRect(x: 0,
                                               y: 0,
                                               width:  self.imageView.frame.width,
                                               height:  self.imageView.frame.height)
        )
        shapeLayer.path = path.cgPath
        overShapeLayer.path = path.cgPath
    }
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
            //            imageView.layer.borderWidth = 4
            //            imageView.layer.borderColor = UIColor.black.cgColor
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
        configShapeLayer() 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
        imageView.layer.addSublayer(shapeLayer)
        imageView.layer.addSublayer(overShapeLayer)
    }
    @IBAction func animateCircle(_ sender: UIButton) {
        animateCircle()
    }
    
    func animateCircle() {
        // Создаем анимацию
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 2
        animation.fromValue = 0 // Стартовое значение
        animation.toValue = 1 // Конечное значение
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.fillMode = .both
        animation.isRemovedOnCompletion = false
        
        // Применяем анимацию
        overShapeLayer.add(animation, forKey: "")
    }
}


