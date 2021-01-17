//
//  FBXLoader.swift
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/06.
//

import Foundation

public class FBXLoader {

    public static func load(url: URL) -> FBX {
        let result = SwiftyFBXLoader.load(with: url)
                        
        if let scene = result.scene {
            print(scene.textureCount())
        }
        
        let mesh: FBXMesh = result.scene?.meshs.first! as! FBXMesh
        let _ = mesh.getControlPointsCount()
        let _ = mesh.getElementNormalCount()
        
        let fbx = FBX()
        return fbx
    }
}
