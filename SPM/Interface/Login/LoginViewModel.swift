//
//  LoginViewModel.swift
//  SPM
//
//  Created by Gonzalo Gonzalez  on 08/02/2020.
//  Copyright © 2020 Gonzalo Gonzalez . All rights reserved.
//

import Foundation

class LoginViewModel {
    
    var loginSuccess: (() -> Void)?

    func login(email: String, password: String) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.loginSuccess?()
        }
    }
}
