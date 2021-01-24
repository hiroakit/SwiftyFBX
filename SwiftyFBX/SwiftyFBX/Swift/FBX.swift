//
//  FBX.swift
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/06.
//

import Foundation

public class FBX {
    let version: String
    let scene: FBXScene?
    
    public var meshs: Array<FBXMesh> {
        guard let scene = self.scene else {
            return []
        }
        return scene.meshs
    }

    public var materials: Array<FBXSkeleton> {
        guard let scene = self.scene else {
            return []
        }
        return scene.skeletons
    }
    
    public var textures: Array<FBXTexture> {
        guard let scene = self.scene else {
            return []
        }
        return scene.textures
    }

    public var skeletons: Array<FBXSkeleton> {
        guard let scene = self.scene else {
            return []
        }
        return scene.skeletons
    }

    public var lights: Array<FBXLight> {
        guard let scene = self.scene else {
            return []
        }
        return scene.lights
    }

    public var cameras: Array<FBXCamera> {
        guard let scene = self.scene else {
            return []
        }
        return scene.cameras
    }
    
    init(scene: FBXScene?) {
        self.version = "1.0.0"
        self.scene = scene
    }
    
    public func getPolygonCount() -> Int {
        return self.scene?.getPolygonCount() ?? 0
    }
}
