//
//  main.swift
//  SwiftyFBX-CLI
//
//  Created by Hiroaki ENDOH on 2021/01/06.
//

import Foundation
import SwiftyFBX

print("Run SwiftyFBX-CLI")
let fileURL = URL(fileURLWithPath: "/Applications/Autodesk/FBX SDK/2020.0.1/samples/ConvertScene/box.fbx")
let fbx = FBXLoader.load(url: fileURL)
print("Result: hoge")
