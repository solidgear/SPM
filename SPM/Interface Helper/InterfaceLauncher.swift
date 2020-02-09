//
//  InterfaceLauncher.swift
//  SPM
//
//  Created by Gonzalo Gonzalez  on 03/01/2020.
//  Copyright © 2020 Gonzalo Gonzalez . All rights reserved.
//

import Foundation
import UIKit

class InterfaceLauncher {
	
	static let instance = InterfaceLauncher()
	
	var window: UIWindow
	
	private init () {
		self.window = UIWindow(frame: UIScreen.main.bounds)
	}
	
	func createUI () {
        window.rootViewController = UINavigationController(rootViewController: MainViewController.instance())
		window.makeKeyAndVisible()
	}
}
