//
//  main.swift
//  fbx
//
//  Created by Hiroaki ENDOH on 2021/01/06.
//

import Foundation
import ArgumentParser
import SwiftyFBX

struct RuntimeError: Error, CustomStringConvertible {
    var description: String
    init(_ description: String) {
        self.description = description
    }
}

struct FBXCommand: ParsableCommand {
    static var _commandName: String {
        return "fbx"
    }
    
    static var configuration = CommandConfiguration(
        abstract: "A utility for the FBX.",
        version: "0.0.1",
        subcommands: [Info.self],
        defaultSubcommand: Info.self)
}

extension FBXCommand {
    struct Info: ParsableCommand {
        static var _commandName: String {
            return "info"
        }

        static var configuration = CommandConfiguration(abstract: "Print values in the FBX file.")

        // filename
        // e.g., "/Applications/Autodesk/FBX SDK/2020.0.1/samples/UVSample/sadface.fbx"
        @Argument(help: "FBX file path")
        var filePath: String?
        
        @Flag(help: "Output texture path only.")
        var isTexturePathOnly: Bool = false

        mutating func run() throws {
            guard let path = self.filePath else {
                throw(RuntimeError("Required the FBX file path."))
            }

            let fileURL = URL(fileURLWithPath: path)
            guard FileManager.default.fileExists(atPath: fileURL.relativePath) else {
                throw(RuntimeError("Not found the FBX file."))
            }

            let fbx = FBXLoader.load(url: fileURL)
            
            guard !isTexturePathOnly else {
                fbx.textures.forEach { (texture) in
                    if let url = texture.url {
                        print(url.relativePath)                        
                    }
                }
                return
            }
            
            print("Version: " + fbx.format.versionString)
            print("Meshs: \(fbx.meshs.count) (\(fbx.getPolygonCount()) polygons)")
            fbx.meshs.forEach { (mesh) in
                print("\t - Name: " + (mesh.name == "" ? "Unknown" : mesh.name))
                print("\t\t - Polygon Count: \(mesh.polygonCount)")
                
                print("\t\t - Polygon Vertex: \(mesh.polygonVertexCount) counts")
                let vertices = mesh.getPolygonVertices()
                for (i, vertex) in zip(vertices.indices, vertices){
                    print("\t\t\t - \(i+1): \(vertex.x), \(vertex.y), \(vertex.z)")
                }

                print("\t\t - Control Points: \(mesh.controlPointsCount) counts")
                for (i, position) in zip(mesh.controlPoints.indices, mesh.controlPoints){
                    print("\t\t\t - \(i+1): \(position.x), \(position.y), \(position.z)")
                }
                
                let normals = mesh.getPolygonVertexNormals()
                print("\t\t - Polygon Vertex Normal: \(normals.count) counts")
                for (i, normal) in zip(normals.indices, normals){
                    print("\t\t\t - \(i+1): \(normal.x), \(normal.y), \(normal.z)")
                }
                
                print("\t\t - Element Normal: \(mesh.elementNormalCount) counts")
                                
                print("\t\t - Local translation (x,y,z): \(mesh.translation.x) \(mesh.translation.y) \(mesh.translation.z)")
                print("\t\t - Local rotation (x,y,z): \(mesh.rotation.x) \(mesh.rotation.y) \(mesh.rotation.z)")
                print("\t\t - Local scale (x,y,z): \(mesh.scale.x) \(mesh.scale.y) \(mesh.scale.z)")
            }
            print("Textures: \(fbx.textures.count)")
            fbx.textures.forEach { (texture) in
                if let url = texture.url {
                    print("\t - " + url.relativePath)
                } else {
                    print("\t - Nothing path in FBX")
                }
            }
            print("Materials: \(fbx.materials.count)")
            fbx.materials.forEach { (material) in
                print("\t - Name: " + (material.name == "" ? "Unknown" : material.name))
                print("\t\t - UUID: " + "\(material.uuid)")
                print("\t\t - Initial Name: " + "\(material.initialName)")
                print("\t\t - Shading Model: " + "\(material.shadingModel)")
                print("\t\t - Is Phong: " + "\(material.isPhong)")
                print("\t\t - Is Lambert: " + "\(material.isLambert)")
                print("\t\t - Ambient: " +
                        "R: \(material.ambient.red), " +
                        "G: \(material.ambient.green), " +
                        "B: \(material.ambient.blue)" )
                print("\t\t - Diffuse: " +
                        "R: \(material.diffuse.red), " +
                        "G: \(material.diffuse.green), " +
                        "B: \(material.diffuse.blue)" )
                print("\t\t - Specular: " +
                        "R: \(material.specular.red), " +
                        "G: \(material.specular.green), " +
                        "B: \(material.specular.blue)" )
                print("\t\t - Specular Factor: " + "\(material.specularFactor)")
                print("\t\t - Emissive: " +
                        "R: \(material.emissive.red), " +
                        "G: \(material.emissive.green), " +
                        "B: \(material.emissive.blue)" )
                print("\t\t - Shininess: " + "\(material.shininess)")
                print("\t\t - Transparency Color: " +
                        "R: \(material.transparencyColor.red), " +
                        "G: \(material.transparencyColor.green), " +
                        "B: \(material.transparencyColor.blue)" )
                print("\t\t - Transparency Factor: " + "\(material.transparencyFactor)")
                print("\t\t - Reflection Color: " +
                        "R: \(material.reflectionColor.red), " +
                        "G: \(material.reflectionColor.green), " +
                        "B: \(material.reflectionColor.blue)" )
                print("\t\t - Reflection Factor: " + "\(material.reflectionFactor)" )
            }
            print("Skeletons: \(fbx.skeletons.count)")
            print("Cameras: \(fbx.cameras.count)")
            fbx.cameras.forEach { (camera) in
                print("\t - Name: " + (camera.name == "" ? "Unknown" : camera.name))
                print("\t\t - Format code: " + "\(camera.format.rawValue)")
                print("\t\t - Postion (x, y, z): " + "\(camera.position.x), " + "\(camera.position.y), " + "\(camera.position.z)")
            }
            print("Lights: \(fbx.lights.count)")
            fbx.lights.forEach { (light) in
                print("\t - Name: " + (light.name == "" ? "Unknown" : light.name))
                print("\t\t - LightType: " + "\(light.lightTypeName)")
                print("\t\t - Local translation (x,y,z): \(light.translation.x) \(light.translation.y) \(light.translation.z)")
            }
//            print("Poses: \(fbx.poses.count)")
//            fbx.poses.forEach { (pose) in
//                print("\t - Name: " + (pose.name == "" ? "Unknown" : pose.name))
//            }
            print("Animations: \(fbx.animationStacks.count)")
            fbx.animationStacks.forEach { (animationStack) in
                print("\t - Name: " + (animationStack.name == "" ? "Unknown" : animationStack.name))
                print("\t\t - Frames: \(animationStack.frameCount)")
            }
        }
    }
}

FBXCommand.main()
