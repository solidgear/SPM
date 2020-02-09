//
//  LoginViewController.swift
//  SPM
//
//  Created by Gonzalo Gonzalez  on 08/02/2020.
//  Copyright © 2020 Gonzalo Gonzalez . All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    private var viewModel: LoginViewModel!
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, viewModel: LoginViewModel) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil )
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        listenNotificationsAboutKeyboard()
        hideKeyboardWhenTappedAround()
        style()
        bind()
    }
    
    deinit {
        removeNotificationsAboutKeyboard()
    }
    
    private func bind () {
        viewModel.loginSuccess = {
            #warning("Add remove loading")
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    private func style () {
        backgroundBlurredStyle()
        emailTextFieldStyle()
        passwordTextFieldStyle()
        loginButtonStyle()
    }
    
    private func backgroundBlurredStyle () {
        let blurredView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        blurredView.frame = self.view.bounds
        backgroundImage.addSubview(blurredView)
    }
    
    private func emailTextFieldStyle () {
        emailField.layer.cornerRadius = 6
        let leftPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 15.0, height: 50.0))
        emailField.leftView = leftPadingView
        emailField.leftViewMode = .always
    }
    
    private func passwordTextFieldStyle () {
        passwordField.layer.cornerRadius = 6
        let leftPadingView = UIView(frame: CGRect(x: 0, y: 0, width: 15.0, height: 50.0))
        passwordField.leftView = leftPadingView
        passwordField.leftViewMode = .always
    }
    
    private func loginButtonStyle () {
        loginButton.layer.cornerRadius = 10
        loginButton.backgroundColor = .orange
    }
    
    //MARK: - Actions
    @IBAction func loginButtonTapped(_ sender: Any) {
        dismissKeyboard()
        guard let email = emailField.text, let password = passwordField.text else { return }
        #warning("Add start loading")
        viewModel.login(email: email, password: password)
    }
}

// MARK: - Keyboard

extension LoginViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func listenNotificationsAboutKeyboard () {
        self.removeNotificationsAboutKeyboard()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    func removeNotificationsAboutKeyboard () {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {

        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        self.view.frame.origin.y = 0
    }
}

extension LoginViewController {
    
    static func instance() -> LoginViewController {
        let modelView: LoginViewModel = LoginViewModel()
        return LoginViewController(nibName: "LoginView", bundle: nil, viewModel: modelView)
    }
}
