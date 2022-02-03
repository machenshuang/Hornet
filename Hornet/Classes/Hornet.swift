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
    private var moduleInvokeDict: [String: HornetProtocol] = [:]
    public static let shared: Hornet = Hornet()
    
    private override init() {}
    
    public class func register(serverName: String, module: HornetProtocol) {
        
    }
    
    public class func unregister(serverName: String) {
        
    }
    
    public class func setupAllModules() {
        
    }
    
    public class func module(by serverName: String) -> HornetProtocol? {
        
        return nil
    }
    
    public class func checkAllModules(with method: Selector, arguments: [Any]) {
        
    }
    
    public class func invokeTarget(id: NSObject, action: Selector, arguments: [Any], returnValue: inout Any) {
        
    }
}
