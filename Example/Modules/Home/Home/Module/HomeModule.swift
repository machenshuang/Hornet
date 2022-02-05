//
//  Home.swift
//  Home
//
//  Created by 马陈爽 on 2022/2/4.
//

import Hornet
import Foundation
import Mediator

public class HomeModule: NSObject, HornetProtocol, HomeService  {
    
    public static let shared: HornetProtocol = HomeModule()
    
    public var priority: Int {
        return 0
    }
    
    public func setup() {
        
    }
    
    public func setupModuleSynchronously() -> Bool {
        return true
    }
    
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        guard let window = application.delegate?.window else {
            return false
        }
        let vc = getViewController()
        let rootNavController = UINavigationController(rootViewController: vc)
        window?.rootViewController = rootNavController
        window?.makeKeyAndVisible()
        return true
    }
    
    public func getViewController() -> UIViewController {
        let vc = HomeViewController()
        return vc
    }

}
