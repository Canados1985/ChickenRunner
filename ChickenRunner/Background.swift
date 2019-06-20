//
//  Background.swift
//  ChickenRunner
//
//  Created by Andrey Osokin on 2019-06-20.
//  Copyright © 2019 Andrey Osokin. All rights reserved.
//
import SpriteKit


func backgroundNode() -> SKSpriteNode {
        // 1
        let bgNode = SKSpriteNode()
        bgNode.anchorPoint = CGPoint.zero
        bgNode.name = "background"
        
        // 2
        let background1 = SKSpriteNode(imageNamed: "bg1")
        background1.anchorPoint = CGPoint.zero
        background1.position = CGPoint(x: 0, y: 0)
        bgNode.addChild(background1)
        
        
        // 3
        let background2 = SKSpriteNode(imageNamed: "bg2")
        background2.anchorPoint = CGPoint.zero
        background2.position =
            CGPoint(x: background1.size.width, y: 0)
        bgNode.addChild(background2)
        
        // 4
        bgNode.size = CGSize(
            width: background1.size.width + background2.size.width,
            height: background1.size.height)
        bgNode.position = CGPoint(x: 0, y: 0)
        
        return bgNode
    }







