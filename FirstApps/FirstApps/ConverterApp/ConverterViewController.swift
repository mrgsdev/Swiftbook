//
//  ConverterViewController.swift
//  FirstApps
//
//  Created by mrgsdev on 18.02.2024.
//

import UIKit

class ConverterViewController: UIViewController {


    @IBOutlet weak var cenliusLabel: UILabel!
    @IBOutlet weak var fahrenheitLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var resetButtonUI: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.value = 50
        resetButtonUI.layer.cornerRadius = 15
        resetButtonUI.clipsToBounds = true
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let temperatureCelsius = Int(round(sender.value))
        cenliusLabel.text = "\(temperatureCelsius)ºC"
        let fahrenheitTemperature = Int(round((sender.value * 9 / 5 ) + 32))
        fahrenheitLabel.text = "\(fahrenheitTemperature)ºF"
        
        
    }

    @IBAction func resetButton() {
        cenliusLabel.text = "50ºC"
        fahrenheitLabel.text = "122ºF"
        slider.value = 50
    }
}
