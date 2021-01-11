//
//  FBXManager.swift
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/06.
//

import Foundation

public class FBXManager {
    lazy var ioSettings = FBXIOSettings.default()
    public static func create() -> FBXManager {
        return FBXManager.init()
    }
}

public class FBXIOSettings {
    public static func `default`() -> FBXIOSettings {
        return FBXIOSettings.init()
    }
    
    public static func create(manager: FBXManager, path: String) -> FBXIOSettings {
        return FBXIOSettings.init()
    }
}

public class FBXDocument {
    
}

public class FBXImporter {
    public static func create(manager: FBXManager, name: String) -> FBXImporter {
        return FBXImporter.init()
    }
    public func initialize(filePath: URL, fileFormat: Int, ioSetting: FBXIOSettings) -> Bool {
        return false;
    }
    public func `import`(document: FBXDocument) {
        
    }
}
