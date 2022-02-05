//
//  Mediator.swift
//  Mediator
//
//  Created by 马陈爽 on 2022/2/4.
//

import Foundation
import UIKit

open class ModuleBundle {
    open class func bundleWithName(_ bundleName: String) -> Bundle? {
        if bundleName.count <= 0 {
            return nil
        }
        guard let path = Bundle.main.path(forResource: bundleName, ofType: "bundle") else {
            return nil
        }
        return Bundle(path: path)
    }
    
    open class func bundle() -> Bundle {
        return Bundle.main
    }
    
    public class func imageNamed(name: String) -> UIImage? {
        return imageNamed(name, in: bundle())
    }
    
    class func imageNamed(_ name: String, in bundle: Bundle) -> UIImage? {
        if name.count <= 0 {
            return nil
        }
        return UIImage(named: name, in: bundle, compatibleWith: nil)
    }
    
    
}
