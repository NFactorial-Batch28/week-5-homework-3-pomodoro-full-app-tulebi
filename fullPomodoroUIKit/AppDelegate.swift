//
//  AppDelegate.swift
//  fullPomodoroUIKit
//
//  Created by Тулеби Берик on 07.05.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = TabBarController()
        return true
    }

}

