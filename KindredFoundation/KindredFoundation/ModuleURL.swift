//
//  ModuleURL.swift
//  KindredFoundation
//
//  Created by Waruna de Silva on 3/6/17.
//  Copyright © 2017 Waruna de Silva. All rights reserved.
//

import Foundation

public protocol Path {
    var path : String { get }
}

open class ModuleURL: Path {
    public var path: String

    
    public init() {
        path = ""
        
    }
    
    public func moduleURL() -> URL? {
        let URL = Foundation.URL(string: "pack-list-mobile://app")!
        return URL.appendingPathComponent(path)
    }
}





