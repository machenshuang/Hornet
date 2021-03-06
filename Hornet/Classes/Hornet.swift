//
//  Hornet.swift
//  Hornet
//
//  Created by machenshuang on 02/01/2022.
//  Copyright (c) 2022 machenshuang. All rights reserved.
//
import Foundation

public class Hornet: NSObject {
    private var moduleDict: [String: HornetProtocol] = [:]
    //private var moduleInvokeDict: [String: HornetProtocol] = [:]
    public static let shared: Hornet = Hornet()
    
    private override init() {
        
    }
    
    public class func register(serviceName: String, module: HornetProtocol) {
        Hornet.shared.moduleDict[serviceName] = module
    }
    
    public class func unregister(serviceName: String) {
        Hornet.shared.moduleDict.removeValue(forKey: serviceName)
    }
    
    public class func setupAllModules() {
        Hornet.shared.moduleDict.values.forEach { module in
            module.setup()
        }
    }
    
    public class func module(by serviceName: String) -> HornetProtocol? {
        return Hornet.shared.moduleDict[serviceName]
    }
    
    class func allRegisteredModules() -> [HornetProtocol] {
        let modules = Hornet.shared.moduleDict.values
        let sortedModules = modules.sorted {
            let priority1 = $0.priority
            let priority2 = $1.priority
            return priority1 < priority2
        }
        return sortedModules
    }
}

extension Hornet: UIApplicationDelegate {
    public func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let modules = Hornet.allRegisteredModules()
        var result = false
        modules.forEach {
            let ret = $0.application?(application, willFinishLaunchingWithOptions: launchOptions) ?? false
            if !result {
                result = ret
            }
        }
        return result
    }
    
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let modules = Hornet.allRegisteredModules()
        var result = false
        modules.forEach {
            let ret = $0.application?(application, didFinishLaunchingWithOptions: launchOptions) ?? false
            if !result {
                result = ret
            }
        }
        return result
    }
    
    public func applicationWillEnterForeground(_ application: UIApplication) {
        let modules = Hornet.allRegisteredModules()
        modules.forEach {
            $0.applicationWillEnterForeground?(application)
        }
    }
    
    public func applicationDidEnterBackground(_ application: UIApplication) {
        let modules = Hornet.allRegisteredModules()
        modules.forEach {
            $0.applicationDidEnterBackground?(application)
        }
    }
    
    public func applicationDidBecomeActive(_ application: UIApplication) {
        let modules = Hornet.allRegisteredModules()
        modules.forEach {
            $0.applicationDidBecomeActive?(application)
        }
    }
    
    public func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let modules = Hornet.allRegisteredModules()
        var result = false
        modules.forEach {
            let ret = $0.application?(app, open: url, options: options) ?? false
            if !result {
                result = ret
            }
        }
        return result
    }
    
    public func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        let modules = Hornet.allRegisteredModules()
        modules.forEach {
            $0.applicationDidReceiveMemoryWarning?(application)
        }
    }
    
    // MARK: - Notification
    public func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        let modules = Hornet.allRegisteredModules()
        modules.forEach {
            $0.application?(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: completionHandler)
        }
    }
    
    
    public func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        let modules = Hornet.allRegisteredModules()
        modules.forEach {
            $0.application?(application, didFailToRegisterForRemoteNotificationsWithError: error)
        }
    }
    
    
    public func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let modules = Hornet.allRegisteredModules()
        modules.forEach {
            $0.application?(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
        }
    }
}
