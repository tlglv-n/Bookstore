//
//  ViewController.swift
//  Bookstore
//
//  Created by Nurikk T. on 13.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var loginField: UITextField!
    @IBOutlet var passwordField: UITextField!
    var viewModel = ViewModel()
    var authViewModel = AuthViewModel()
    
    @IBOutlet var statusLabel: UILabel!
    
    @IBAction func signUpPressed(_ sender: Any) {
        DispatchQueue.main.async {
            self.viewModel.userSignUpPressed(login: (self.loginField.text ?? ""), password: (self.passwordField.text ?? ""))
        }
    }
    @IBAction func loginButtonPressed(_ sender: Any) {
        DispatchQueue.main.async {
            self.viewModel.userLoginPressed(login: (self.loginField.text ?? ""), password: (self.passwordField.text ?? ""))
            
            if self.viewModel.signInProccess() {
                let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let tabBarView = mainStoryboard.instantiateViewController(withIdentifier: "TabBarController") as! TabBarViewController
                self.addChild(tabBarView)
                self.view.addSubview(tabBarView.view)
                tabBarView.didMove(toParent: self)
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialState()
        bindViewModel()
    }
    
    func initialState() {
        statusLabel?.text = "Please enter your login credentials"
        statusLabel?.textColor = UIColor.lightGray
    }
    
    func bindViewModel() {
        viewModel.statusText.bind({ (statusText) in
            DispatchQueue.main.async {
                self.statusLabel.text = statusText
            }
        })
        
        viewModel.statusColor.bind({ (statusColor) in
            DispatchQueue.main.async {
                self.statusLabel.textColor = statusColor
            }
        })
    }


}

