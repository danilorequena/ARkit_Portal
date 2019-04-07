//
//  extensions.swift
//  Portal
//
//  Created by Danilo Requena on 07/04/19.
//  Copyright © 2019 Danilo Requena. All rights reserved.
//

import Foundation
import SceneKit
import ARKit

var width:CGFloat = 0.03
var height:CGFloat = 1
var lenght:CGFloat = 1

var doorLength:CGFloat = 0.3

func createBox(isDoor: Bool) -> SCNNode  {
    let node = SCNNode()
    
    //Add a First Box
    let firstBox = SCNBox(width: width, height: height, length: isDoor ? doorLength:lenght, chamferRadius: 0 )
    firstBox.firstMaterial?.diffuse.contents = UIColor.white
    let firstBoxNode = SCNNode(geometry: firstBox)
    firstBoxNode.renderingOrder = 200
    
    node.addChildNode(firstBoxNode)
    
    //Add a Masked Box
    let maskedBox = SCNBox(width: width, height: height, length: isDoor ? doorLength:lenght, chamferRadius: 0)
    maskedBox.firstMaterial?.diffuse.contents = UIColor.white
    maskedBox.firstMaterial?.transparency = 0.000000001
    
    let maskedBoxNode = SCNNode(geometry: maskedBox)
    maskedBoxNode.renderingOrder = 100
    maskedBoxNode.position = SCNVector3(width, 0, 0)
    
    node.addChildNode(maskedBoxNode)
    
    return node
}

extension FloatingPoint {
    var degreesToRadians : Self {
        return self * .pi / 180
    }
    var radiansToDegees : Self {
        return self * 180 / .pi
    }
}

