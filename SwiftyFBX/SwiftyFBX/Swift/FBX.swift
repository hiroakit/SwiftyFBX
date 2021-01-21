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
    let meshs: Array<Any>
    let textures: Array<Any>

    init(scene: FBXScene?) {
        self.version = "1.0.0"
        self.scene = scene
        self.meshs = Array()
        self.textures = Array()
    }
}
