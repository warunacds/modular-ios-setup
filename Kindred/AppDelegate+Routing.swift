//
//  AppDelegate+Routing.swift
//  Kindred
//
//  Created by Waruna de Silva on 3/6/17.
//  Copyright © 2017 Waruna de Silva. All rights reserved.
//

import Foundation
import KinderedFoundation
import KindredTabApp
import KindredSingleViewApp

extension AppDelegate {
    
    func configRouting () {
        
        reigsterModuleURL()
        if let window = window {
            let applicationFlowController = ApplicationFlowController(window: window)
            SharedModuleRouter.registerHostApp(applicationFlowController)
            appFlowController = applicationFlowController
            

        }
    }
    
    func reigsterModuleURL() {
        
        //Register all  modules here
        
        SharedModuleRouter.registerModuleClass(KTATableViewController.self, URLPath: KindredTabAppModuleURL().path)
        SharedModuleRouter.registerModuleClass(KSViewController.self, URLPath: KindredSingleViewAppModuleURL().path)
        
    }
}
