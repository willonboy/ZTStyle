//
//  AppDelegate.swift
//  ZTStyle
//
//  Created by trojan on 2024/6/4.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow()
            .zt
            .frame(UIScreen.main.bounds)
            .backgroundColor(.red)
            .rootViewController(ViewController())
            .subject
        self.window?.makeKeyAndVisible()
        
        self.window?.zt.style(
            .custom({ $0.backgroundColor = .yellow }),
            .custom({ $0.backgroundColor = .blue }),
            .custom({ $0.backgroundColor = .systemPurple })
        )
        
        return true
    }
}

