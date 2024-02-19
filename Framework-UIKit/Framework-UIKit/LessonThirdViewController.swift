//
//  LessonThirdViewController.swift
//  Framework-UIKit
//
//  Created by mrgsdev on 19.02.2024.
//  UITextView & UIStepper & UIActivityIndicatorView & UIProgressView & UIProgressView

import UIKit

class LessonThirdViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView.setProgress(0, animated: true)
        
        stepper.value = 17
        stepper.minimumValue = 10
        stepper.maximumValue = 25
        stepper.tintColor = .white
        stepper.backgroundColor = .gray
        stepper.layer.cornerRadius = 5
        
        textView.isHidden = true
//        textView.alpha = 0
        stepper.isHidden = true
        countLabel.isHidden = true
        
        textView.delegate = self
        textView.font = UIFont(name: "HelveticaNeue", size: 16)
        textView.layer.cornerRadius = 10
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
//        UIView.animate(withDuration: 0, delay: 3, options: .curveLinear) { //UIActivityIndicatorView
//            self.textView.alpha = 1
//        } completion: { finished in
//            self.activityIndicator.stopAnimating()
//            self.textView.isHidden = false
//            self.stepper.isHidden = false
//            self.countLabel.isHidden = false
//        }
        
        
        activityIndicator.hidesWhenStopped = true // индикатор по окончанию уйдет
        activityIndicator.color = .red
        activityIndicator.startAnimating()
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            if self.progressView.progress != 1 {
                self.progressView.progress += 0.2
            }else{
                self.activityIndicator.stopAnimating()
                self.textView.isHidden = false
                self.stepper.isHidden = false
                self.countLabel.isHidden = false
                self.progressView.isHidden = true
           
            }
        }
        
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
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        if let font = textView.font?.fontName {
            let fontSize = CGFloat(sender.value)
            textView.font = UIFont(name: font, size: fontSize)
        }
        
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
        return textView.text.count + (text.count - range.length) <= 3000
    }
    
}
