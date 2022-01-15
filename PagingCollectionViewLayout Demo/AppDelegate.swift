//
//  AppDelegate.swift
//  PagingCollectionViewLayout
//
//  Created by Vladislav Mashkov on 15.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        let vc = ViewController()
        
        window?.rootViewController = vc
        
        
        return true
    }


}

