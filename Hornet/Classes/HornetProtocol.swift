//
//  HornetProtocol.swift
//  Hornet
//
//  Created by 马陈爽 on 2022/2/2.
//

import Foundation
import UIKit

public protocol HornetProtocol {
    static var shared: HornetProtocol { get }
    var priority: Int { get }
    func setupModule()
    func setupModuleSynchronously()
}
