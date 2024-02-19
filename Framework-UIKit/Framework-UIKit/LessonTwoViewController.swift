//
//  LessonTwoViewController.swift
//  Framework-UIKit
//
//  Created by mrgsdev on 19.02.2024.
//  UISegmentControl & UISlider & UITextField & UIScrollView & UIDatePicker & UISwitch & UIPickerView

import UIKit

class LessonTwoViewController: UIViewController {
    
    var uiElementsArray = ["UISegmentControl","UILabel","UISlider","UITextField","UIButton","UIDatePicker"]
    
    var selectedElement:String?
    
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var switches: UISwitch!
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
        
        label.text = String(Int(slider.value))
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 0
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: true)
        switches.isOn = !switches.isOn
        switches.onTintColor = .black
        switches.tintColor = .black
        createToolBar()
        choiceUIElement()
        
    }
    
    func hideAllElement()  {
        slider.isHidden = true
        datePicker.isHidden = true
        doneButton.isHidden = true
        label.isHidden = true
        segmentedControl.isHidden = true
        textField.isHidden = true
    }
    
    func choiceUIElement() {
        let elementPicker = UIPickerView()
        elementPicker.delegate = self
        textField.inputView = elementPicker // при нажатие на txtfld открывается UIPickerView()
        
        // Custom
        elementPicker.backgroundColor = .brown
        
    }
    
    func createToolBar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dissmissKeyboard))
        toolbar.setItems([doneButton], animated: true)
        toolbar.isUserInteractionEnabled = true
        textField.inputAccessoryView =  toolbar
        
        toolbar.tintColor = .white
        toolbar.barTintColor = .brown
        
    }
    @objc func dissmissKeyboard(){
        view.endEditing(true)
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        if switches.isOn {
            view.backgroundColor = .gray
        } else {
            view.backgroundColor = .green
        }
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
}

extension LessonTwoViewController:UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1 // количество барабанов
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        uiElementsArray.count // количество элементов в UIPickerView
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return uiElementsArray[row] // отображает определенное значение с массива
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedElement = uiElementsArray[row] // позволяет работать с выбранным элементом
        textField.text = selectedElement
        
        switch row {
        case 0:
            hideAllElement()
            segmentedControl.isHidden = false
        case 1:
            hideAllElement()
            label.isHidden = false
        case 2:
            hideAllElement()
            slider.isHidden = false
        case 3:
            hideAllElement()
            textField.isHidden = false
        case 4:
            hideAllElement()
            doneButton.isHidden = false
        case 5:
            hideAllElement()
            datePicker.isHidden = false
        default:
            hideAllElement()
        }
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var pickerViewLabel = UILabel()
        if let currentLabel = view as? UILabel {
            pickerViewLabel = currentLabel
        } else {
            pickerViewLabel = UILabel()
        }
        pickerViewLabel.textColor = .white
        pickerViewLabel.textAlignment = .center
        pickerViewLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 23)
        pickerViewLabel.text = uiElementsArray[row]
        return pickerViewLabel //  работа с label внутри UIPickerView
    }
    
}
