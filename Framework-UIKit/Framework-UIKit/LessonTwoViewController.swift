//
//  LessonTwoViewController.swift
//  Framework-UIKit
//
//  Created by mrgsdev on 19.02.2024.
//

import UIKit

class LessonTwoViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var datePicker: UIDatePicker!
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
        label.numberOfLines = 0
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: true)
        
        
        
    }
    
    
    @IBAction func donePressed(_ sender: UIButton) {
        guard let text = textField.text, !text.isEmpty else {
            let alertController = UIAlertController(title: "Ошибка", message: "", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
            showAlertWithTextField(title: "Ошибка", message: "Текстовое поле пустое")
            return
        }
        if let _ = Double(text) {
            showAlertWithTextField(title: "Ошибка", message: "Введите имя")
        } else{
            label.text = text
            textField.text = nil
        }
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
    
    @IBAction func datePickerAction(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        let dateValue = dateFormatter.string(from: sender.date)
        
        
        
        label.text = dateValue
    }
    private func showAlertWithTextField(title: String, message: String) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            alertController.addTextField { (textField) in
                textField.placeholder = "Введите данные"
            }
            
            let confirmAction = UIAlertAction(title: "OK", style: .default) { (_) in
                if let textField = alertController.textFields?.first, let text = textField.text, !text.isEmpty {
                    self.label.text = text
                    self.textField.text = nil
                }
            }
            
            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            
            alertController.addAction(confirmAction)
            alertController.addAction(cancelAction)
            
            present(alertController, animated: true, completion: nil)
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
