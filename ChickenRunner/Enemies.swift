//
//  Enemies.swift
//  ChickenRunner
//
//  Created by Andrey Osokin on 2019-06-28.
//  Copyright © 2019 Andrey Osokin. All rights reserved.
//
import SpriteKit
import Foundation


func drawEnemyFarmer(farmer: SKSpriteNode, screenWidth: CGFloat, screenHeight: CGFloat, platform12_1: SKSpriteNode, platform12_2: SKSpriteNode )
{
    farmer.anchorPoint = CGPoint.zero
    randomNumber = Int.random(in: 700 ..< 1200)
    randomHeight = Int.random(in: -100 ..< 100)
    farmer.setScale(1)
    //farmer.position = CGPoint(x: 500 , y: 500)
    farmer.zPosition = -40
    
}

func updateEnemy(farmer: SKSpriteNode, screenWidth: CGFloat, screenHeight: CGFloat, platform12_1: SKSpriteNode, platform12_2: SKSpriteNode)
{
    farmer.position.x = platform12_1.position.x + platform12_1.size.width / 4
    farmer.position.y = platform12_1.position.y + platform12_1.size.height / 2
    
    //print("\(farmer.position.x) FARMER POSITION X HERE")
    //print("\(farmer.position.y) FARMER POSITION Y HERE")
    
    
    //print("\(platform12_1.position.x) PLATFORM12_1 POSITION X HERE")
    //print("\(platform12_1.position.y) PLATFORM12_1 POSITION Y HERE")
}
