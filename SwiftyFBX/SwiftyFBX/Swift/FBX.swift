//
//  FBX.swift
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/06.
//

import Foundation

public class FBX {
    public let format: SwiftyFBXFormat
    let scene: FBXScene?
    
    public var meshs: Array<FBXMesh> {
        guard let scene = self.scene else {
            return []
        }
        return scene.meshs
    }

    public var materials: Array<FBXSurfaceMaterial> {
        guard let scene = self.scene else {
            return []
        }
        return scene.materials
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
    
    public var poses: Array<FBXPose> {
        guard let scene = self.scene else {
            return []
        }
        return scene.poses
    }

    public var animationStacks: Array<FBXAnimStack> {
        guard let scene = self.scene else {
            return []
        }
        return scene.animationStacks
    }

    public var axis: AxisSystem {
        guard let scene = self.scene else {
            return AxisSystemUnknown
        }
        return scene.getCurrentAxis()
    }
    
    init(scene: FBXScene?, format: SwiftyFBXFormat) {
        self.format = format
        self.scene = scene
    }
    
    public func getPolygonCount() -> Int {
        return self.scene?.getPolygonCount() ?? 0
    }
}
