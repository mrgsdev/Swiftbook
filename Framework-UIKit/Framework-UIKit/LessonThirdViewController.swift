//
//  LessonThirdViewController.swift
//  Framework-UIKit
//
//  Created by mrgsdev on 19.02.2024.
//  UITextView

import UIKit

class LessonThirdViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = nil
        textView.delegate = self
        textView.font = UIFont(name: "HelveticaNeue", size: 16)
        textView.layer.cornerRadius = 10
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
           NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            // Вычисляем расстояние между нижней границей текстового поля и верхней границей клавиатуры
            let bottomInset = keyboardFrame.height
            
            // Устанавливаем новое значение contentInset для UITextView
            textView.contentInset.bottom = bottomInset
        }
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        // Сбрасываем contentInset, когда клавиатура скрывается
        textView.contentInset = .zero
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
//      textView.resignFirstResponder()
    }

}


extension LessonThirdViewController:UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) { // при тапе на TextView
        textView.backgroundColor = .orange
        textView.textColor = .white
    }
    
    func textViewDidEndEditing(_ textView: UITextView) { // по окончанию работы с TextView
        textView.backgroundColor = .white
        textView.textColor = .black
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        countLabel.text = "\(textView.text.count)"
        return textView.text.count + (text.count - range.length) <= 50
    }
}
