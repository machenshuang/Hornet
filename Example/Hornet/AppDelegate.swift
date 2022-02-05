//
//  AppDelegate.swift
//  Hornet
//
//  Created by machenshuang on 02/01/2022.
//  Copyright (c) 2022 machenshuang. All rights reserved.
//

import UIKit
import Hornet
import Home
import Mediator

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        Hornet.register(serviceName: "\(HomeService.Type.self)", module: HomeModule.shared)
        Hornet.setupAllModules()
        return Hornet.shared.application(application, willFinishLaunchingWithOptions: launchOptions)
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        return Hornet.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

