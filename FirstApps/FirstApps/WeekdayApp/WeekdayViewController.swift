//
//  ViewController.swift
//  FirstApps
//
//  Created by mrgsdev on 18.02.2024.
//

import UIKit

class WeekdayViewController: UIViewController {
    
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var findDayButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
        findDayButton.layer.cornerRadius = 15
        clearButton.layer.cornerRadius = 15
        clearButton.isHidden = true
        applyCornerRadius(to: dateTF)
        applyCornerRadius(to: monthTF)
        applyCornerRadius(to: yearTF)
    }
    
    @IBAction func findDay(_ sender: UIButton) {
        
        guard let dateText = dateTF.text, !dateText.isEmpty,
              let monthText = monthTF.text, !monthText.isEmpty,
              let yearText = yearTF.text, !yearText.isEmpty else {
            showAlert(with: "Ошибка", message: "Пожалуйста, заполните все поля")
            return
        }
        
        guard let day = Int(dateText), (1...30).contains(day),
              let month = Int(monthText), (1...12).contains(month),
              let year = Int(yearText), (1...2100).contains(year) else {
            showAlert(with: "Ошибка", message: "Введите корректную дату (день от 1 до 30, месяц до 12, год до 2100)")
            return
        }
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        dateFormatter.dateFormat = "EEEE"
        
        if let date = calendar.date(from: dateComponents) {
            let weekday = dateFormatter.string(from: date)
            let capitalizedWeek = weekday.capitalized
            resultLabel.text = capitalizedWeek
        }
        clearButton.isHidden = false
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        showClearConfirmationAlert()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func clearTextFields() {
        dateTF.text = ""
        monthTF.text = ""
        yearTF.text = ""
        resultLabel.text = ""
        clearButton.isHidden = !clearButton.isHidden
    }
    func showClearConfirmationAlert() {
        let alertController = UIAlertController(title: "Очистить поля?", message: "Вы уверены, что хотите очистить все поля?", preferredStyle: .alert)
        
        let clearAction = UIAlertAction(title: "Да", style: .default) { [weak self] (_) in
            self?.clearTextFields()
        }
        
        let cancelAction = UIAlertAction(title: "Нет", style: .cancel, handler: nil)
        
        alertController.addAction(clearAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }

}

extension UIViewController{
    func showAlert(with title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func applyCornerRadius(to textField: UITextField) {
        textField.layer.cornerRadius = 15
        textField.clipsToBounds = true
    }
    
}
