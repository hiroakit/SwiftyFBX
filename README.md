# SwiftyFBX

The FBX for Swift. It depends on the [Autodesk FBX SDK](https://www.autodesk.com/developer-network/platform-technologies/fbx#).

# Status

- Currently, Making the MVP. 
- Working in progress.

# Usage - SwiftyFBX.framework

```swift
import SwiftyFBX

let fileURL = URL(fileURLWithPath: "path/for/fbx")
guard FileManager.default.fileExists(atPath: fileURL.relativePath) else {
	return
}
let fbx = FBXLoader.load(url: fileURL)
```

# Usage - fbx command

In this repository, sample program `fbx` is included.

```sh
$ fbx info foo.fbx
Version: 7.2.0
File header info:
	 - Creator: FBX SDK/FBX Plugins version 2012.0
Axis: Y Up, Parity odd
Scene document info:
	 - FileName: /Users/johndoe/hoge/hoge.fbx
	 - Title: 
	 - Author: 
	 - Application: Autodesk Maya 2012
Meshs: 1 (6 polygons)
	 - Name: Unknown
		 - Polygon Count: 6
		 - Polygon Vertex: 24 counts
			 - 1: -2.5569794178009, -0.747216463088989, 2.50774145126343
			 - 2: 2.5569794178009, -0.747216463088989, 2.50774145126343
			 - 3: 2.5569794178009, 0.747216463088989, 2.50774145126343
			 - 4: -2.5569794178009, 0.747216463088989, 2.50774145126343
			 - 5: -2.5569794178009, 0.747216463088989, 2.50774145126343
			 - 6: 2.5569794178009, 0.747216463088989, 2.50774145126343
			 - 7: 2.5569794178009, 0.747216463088989, -2.50774145126343
			 - 8: -2.5569794178009, 0.747216463088989, -2.50774145126343
			 - 9: -2.5569794178009, 0.747216463088989, -2.50774145126343
			 - 10: 2.5569794178009, 0.747216463088989, -2.50774145126343
			 - 11: 2.5569794178009, -0.747216463088989, -2.50774145126343
			 - 12: -2.5569794178009, -0.747216463088989, -2.50774145126343
			 - 13: -2.5569794178009, -0.747216463088989, -2.50774145126343
			 - 14: 2.5569794178009, -0.747216463088989, -2.50774145126343
			 - 15: 2.5569794178009, -0.747216463088989, 2.50774145126343
			 - 16: -2.5569794178009, -0.747216463088989, 2.50774145126343
			 - 17: 2.5569794178009, -0.747216463088989, 2.50774145126343
			 - 18: 2.5569794178009, -0.747216463088989, -2.50774145126343
			 - 19: 2.5569794178009, 0.747216463088989, -2.50774145126343
			 - 20: 2.5569794178009, 0.747216463088989, 2.50774145126343
			 - 21: -2.5569794178009, -0.747216463088989, -2.50774145126343
			 - 22: -2.5569794178009, -0.747216463088989, 2.50774145126343
			 - 23: -2.5569794178009, 0.747216463088989, 2.50774145126343
			 - 24: -2.5569794178009, 0.747216463088989, -2.50774145126343
		 - Control Points: 8 counts
			 - 1: -2.5569794178009, -0.747216463088989, 2.50774145126343
			 - 2: 2.5569794178009, -0.747216463088989, 2.50774145126343
			 - 3: -2.5569794178009, 0.747216463088989, 2.50774145126343
			 - 4: 2.5569794178009, 0.747216463088989, 2.50774145126343
			 - 5: -2.5569794178009, 0.747216463088989, -2.50774145126343
			 - 6: 2.5569794178009, 0.747216463088989, -2.50774145126343
			 - 7: -2.5569794178009, -0.747216463088989, -2.50774145126343
			 - 8: 2.5569794178009, -0.747216463088989, -2.50774145126343
		 - Polygon Vertex Normal: 24 counts
			 - 1: 0.0, 0.0, 1.0
			 - 2: 0.0, 0.0, 1.0
			 - 3: 0.0, 0.0, 1.0
			 - 4: 0.0, 0.0, 1.0
			 - 5: 0.0, 1.0, 0.0
			 - 6: 0.0, 1.0, 0.0
			 - 7: 0.0, 1.0, 0.0
			 - 8: 0.0, 1.0, 0.0
			 - 9: 0.0, 0.0, -1.0
			 - 10: 0.0, 0.0, -1.0
			 - 11: 0.0, 0.0, -1.0
			 - 12: 0.0, 0.0, -1.0
			 - 13: 0.0, -1.0, 0.0
			 - 14: 0.0, -1.0, 0.0
			 - 15: 0.0, -1.0, 0.0
			 - 16: 0.0, -1.0, 0.0
			 - 17: 1.0, 0.0, 0.0
			 - 18: 1.0, 0.0, 0.0
			 - 19: 1.0, 0.0, 0.0
			 - 20: 1.0, 0.0, 0.0
			 - 21: -1.0, 0.0, 0.0
			 - 22: -1.0, 0.0, 0.0
			 - 23: -1.0, 0.0, 0.0
			 - 24: -1.0, 0.0, 0.0
		 - Element Normal: 1 counts
		 - Local translation (x,y,z): 2.5177528788177 0.747216475053324 -2.61612772723135
		 - Local rotation (x,y,z): 0.0 0.0 0.0
		 - Local scale (x,y,z): 1.0 1.0 1.0
Textures: 1
	 - /Users/johndoe/hoge/textures/sample1.png
Materials: 1
	 - Name: lambert2
		 - UUID: 46
		 - Initial Name: lambert2
		 - Shading Model: Lambert
		 - Is Phong: false
		 - Is Lambert: true
		 - Ambient: R: 0.0, G: 0.0, B: 0.0
		 - Diffuse: R: 0.5, G: 0.5, B: 0.5
		 - Specular: R: 0.0, G: 0.0, B: 0.0
		 - Specular Factor: 0.0
		 - Emissive: R: 0.0, G: 0.0, B: 0.0
		 - Shininess: 0.0
		 - Transparency Color: R: 0.0, G: 0.0, B: 0.0
		 - Transparency Factor: 1.0
		 - Reflection Color: R: 0.0, G: 0.0, B: 0.0
		 - Reflection Factor: 0.0
Skeletons: 0
Cameras: 1
	 - Name: camera1
		 - Format code: 0
		 - Postion (x, y, z): 10.0564563181416, 0.0, 5.1298712056382
Lights: 2
	 - Name: Unknown
		 - LightType: Point
		 - Local translation (x,y,z): -5.08826013770999 0.0 4.80601112743787
	 - Name: Unknown
		 - LightType: Point
		 - Local translation (x,y,z): 10.0566091669226 0.0 -10.0452499700597
Animations: 1
	 - Name: Take 001
		 - Frames: 28
```

# Dependency

- [Autodesk FBX SDK 2020.2 Clang (Universal Binary)](https://www.autodesk.com/developer-network/platform-technologies/fbx-sdk-2020-2)

# Architecture

- Swift <-- Objective-C++ <-- C++ (FBX SDK)

# How to build

1. Install FBX SDK via Homebrew.
   
   ```sh
   brew tap hiroakit/homebrew-formula
   brew install hiroakit/formula/fbx
   ```
   
2. Clone this repository.
3. Open SwiftyFBX.xcworkspace.
4. Select SwiftyFBX scheme.
5. Build.

# License

Licensed under [the MIT license](./LICENSE).  
Please note that our library uses the Autodesk FBX SDK provided by Autodesk.
Thus, you must follow their license.
