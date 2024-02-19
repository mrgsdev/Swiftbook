//
//  WebViewController.swift
//  Framework-UIKit
//
//  Created by mrgsdev on 19.02.2024.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var urlTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urlTextField.delegate = self
        webView.navigationDelegate = self
        let homepage = "https://swiftbook.ru/"
        let url = URL(string: homepage)
        let request = URLRequest(url: url!)
        urlTextField.text = homepage
        webView.load(request)
        webView.allowsBackForwardNavigationGestures = true
        
    
        
    }
    
    @IBAction func upButtonPressed(_ sender: UIButton) {
        
        if webView.canGoForward {
            webView.goForward()
        }
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        if webView.canGoBack {
            webView.goBack()
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


extension WebViewController:UITextFieldDelegate,WKNavigationDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let urlString = textField.text!
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        webView.load(request)
        
        textField.resignFirstResponder()
        return true
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        urlTextField.text = webView.url?.absoluteString
        
        backButton.isEnabled = webView.canGoBack
        upButton.isEnabled = webView.canGoForward
    }
}
