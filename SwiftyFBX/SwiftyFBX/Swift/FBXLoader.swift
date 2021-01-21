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
        
        guard let scene = result.scene else {
            return FBX(scene: nil)
        }
        
        let fbx = FBX(scene: scene)
        print("Meshs: \(scene.meshs.count)")
        print("Textures: \(scene.textures.count)")
        scene.textures.forEach { (texture) in
            print("\t - " + texture.url.path)
        }
        
//        let mesh: FBXMesh = result.scene?.meshs.first! as! FBXMesh
//        let _ = mesh.getControlPointsCount()
//        let _ = mesh.getElementNormalCount()
        
        return fbx
    }
}
