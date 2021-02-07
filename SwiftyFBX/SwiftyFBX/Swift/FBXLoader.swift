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
            return FBX(scene: nil, format: SwiftyFBXFormat.unknown())
        }
        
        return FBX(scene: scene, format: result.format)
    }
}
