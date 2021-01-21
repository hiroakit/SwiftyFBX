//
//  main.swift
//  fbx
//
//  Created by Hiroaki ENDOH on 2021/01/06.
//

import Foundation
import Commander
import SwiftyFBX

// filename
// e.g., "/Applications/Autodesk/FBX SDK/2020.0.1/samples/UVSample/sadface.fbx"
let main = command { (filename: String) in
    let fileURL = URL(fileURLWithPath: filename)
    let _ = FBXLoader.load(url: fileURL)
}

main.run()

