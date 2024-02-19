//
//  LessonTwoViewController.swift
//  Framework-UIKit
//
//  Created by mrgsdev on 19.02.2024.
//

import UIKit

class LessonTwoViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = 50
        slider.minimumTrackTintColor = .black
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
//        label.isHidden = !label.isHidden
        label.text = String(Int(slider.value))
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: true)
        
        
        
    }
    @IBAction func sliderAction(_ sender: UISlider) {
        label.text = String(Int(sender.value))
        
 
        self.view.backgroundColor = self.view.backgroundColor!.withAlphaComponent(CGFloat(sender.value))
        
    }
    @IBAction func choiceSegment(_ sender: UISegmentedControl) {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            label.text = "First"
            label.isHidden = false
        case 1:
            label.text = "Second"
            label.isHidden = false
        case 2:
            label.text = "Third"
            label.isHidden = false
        default:
            break
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
