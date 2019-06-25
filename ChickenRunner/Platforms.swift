//
//  Platforms.swift
//  ChickenRunner
//
//  Created by Andrey Osokin on 2019-06-24.
//  Copyright © 2019 Andrey Osokin. All rights reserved.
//

import SpriteKit


//var randomScale = CGFloat.random(in: 1 ..< 4)
//var randomHeight = Int.random(in: -100 ..< 100)


func drawPlatform3x6(platform3X6: SKSpriteNode, screenWidth: CGFloat, screenHeight: CGFloat)
{
    randomNumber = Int.random(in: 700 ..< 1200)

    platform3X6.position = CGPoint(x: screenWidth * 3, y: 0 - platform3X6.size.height / 3)
    platform3X6.setScale(3)
    platform3X6.zPosition = 0
}

func drawPlatform6x6(platform6X6: SKSpriteNode, screenWidth: CGFloat, screenHeight: CGFloat)
{
    randomNumber = Int.random(in: 700 ..< 1200)
    
    platform6X6.position = CGPoint(x: screenWidth * 2, y: 0 - platform6X6.size.height / 3)
    platform6X6.setScale(3)
    platform6X6.zPosition = 0
}

func drawPlatform12x6(platform12X6: SKSpriteNode, screenWidth: CGFloat, screenHeight: CGFloat)
{
    randomNumber = Int.random(in: 700 ..< 1200)
    
    platform12X6.position = CGPoint(x: 0, y: 0 - platform12X6.size.height / 3)
    platform12X6.setScale(3)
    platform12X6.zPosition = 0
}
