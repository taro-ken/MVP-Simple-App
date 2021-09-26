//
//  AppDelegate.swift
//  MVP-Simple-App
//
//  Created by 木元健太郎 on 2021/09/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        Router.showRoot(window: window)
        return true
    }



}

