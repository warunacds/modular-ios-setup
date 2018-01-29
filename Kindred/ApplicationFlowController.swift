//
//  ApplicationFlowController.swift
//  Kindred
//
//  Created by Waruna de Silva on 3/6/17.
//  Copyright © 2017 Waruna de Silva. All rights reserved.
//

import Foundation
import UIKit
import KinderedFoundation
import KindredTabApp
import KindredSingleViewApp

@objc class ApplicationFlowController : NSObject, ModuleURLObserver {
    
    let rootViewController: UITabBarController

    init(window: UIWindow) {
        
        if let homeViewController = SharedModuleRouter.moduleForURLPath(KindredTabAppModuleURL().path) {
            
            
            let mainTabBarController = TabBarController()
            
            
            homeViewController.tabBarItem.title = "Home"
            
            let secondViewController = SharedModuleRouter.moduleForURLPath(KindredSingleViewAppModuleURL().path)
            secondViewController?.tabBarItem.title = "Learn"
            
            mainTabBarController.setViewControllers([homeViewController, secondViewController!], animated: true)
            
            window.addSubview(mainTabBarController.view)
            window.rootViewController = mainTabBarController
            rootViewController = mainTabBarController
            homeViewController.handleModuleURL(KindredTabAppModuleURL())
            
            
            
        } else {
            
            rootViewController = UITabBarController()
        }
        
        super.init()
    }
    
    func registerAsHost() {
        
        SharedModuleRouter.registerHostApp(self)
    }
    
    internal func handleModuleURL(_ moduleURL: ModuleURL, successCallback: ModuleURL? = nil, failureCallback: ModuleURL? = nil) -> Bool {
        switch moduleURL {
        case is KindredTabAppModuleURL:
            if let homeViewController = SharedModuleRouter.moduleForURLPath(moduleURL.path) {
                rootViewController.show(homeViewController, sender: self)
                homeViewController.handleModuleURL(moduleURL)
            }
            return true
            
        case is KindredSingleViewAppModuleURL:
            if let nextModuleViewController = SharedModuleRouter.moduleForURLPath(KindredSingleViewAppModuleURL().path) {
                rootViewController.show(nextModuleViewController, sender: self)//(nextModuleViewController, animated: true)
                nextModuleViewController.handleModuleURL(moduleURL)
            }
            return true
        default:
            print("Home Module cannot handle URL: \(moduleURL)")
            return false
        }
    }
    
}
