//
//  ModuleURLConsumer.swift
//  KindredFoundation
//
//  Created by Waruna de Silva on 3/6/17.
//  Copyright © 2017 Waruna de Silva. All rights reserved.
//

import Foundation

public protocol ModuleURLObserver: class {
    func handleModuleURL(_ moduleURL: ModuleURL, successCallback: ModuleURL?, failureCallback: ModuleURL?) -> Bool
}

public protocol ModuleURLConsumer: class, ModuleURLObserver {
    var successCallback: ModuleURL? { get }
    var failureCallback: ModuleURL? { get }
}

open class ModuleViewController: UIViewController, ModuleURLConsumer {
    open var successCallback: ModuleURL?
    open var failureCallback: ModuleURL?
    
    open func handleModuleURL(_ moduleURL: ModuleURL, successCallback: ModuleURL? = nil, failureCallback: ModuleURL? = nil) -> Bool {
        fatalError("Subclass must implement")
    }
}
