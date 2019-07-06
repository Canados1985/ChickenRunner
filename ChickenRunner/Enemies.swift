//
//  Enemies.swift
//  ChickenRunner
//
//  Created by Andrey Osokin on 2019-06-28.
//  Copyright © 2019 Andrey Osokin. All rights reserved.
//
import SpriteKit
import Foundation

var randomChance = Int()

var farmerIsActive = Bool(true)

func drawEnemyFarmer(farmer: SKSpriteNode, screenWidth: CGFloat, screenHeight: CGFloat, platform6X6_2: SKSpriteNode )
{
    farmer.anchorPoint = CGPoint.zero
    randomNumber = Int.random(in: 700 ..< 1200)
    randomHeight = Int.random(in: -100 ..< 100)
   
    farmer.setScale(3)
    farmer.position.x = platform6X6_2.position.x - platform6X6_2.size.width / 3
    farmer.position.y = platform6X6_2.position.y + platform6X6_2.size.height / 2
    farmer.zPosition = 0
    

    
    farmer.physicsBody = SKPhysicsBody(rectangleOf: farmer.size)
    
    farmer.physicsBody?.affectedByGravity = false;
    farmer.physicsBody?.isDynamic = false
    
}

/*
func updateEnemy(farmer: SKSpriteNode, screenWidth: CGFloat, screenHeight: CGFloat, platform6X6_1: SKSpriteNode, platform6X6_2: SKSpriteNode)
{
    

    if(randomChance == 2)
    {
        farmer.position.x = platform6X6_2.position.x - platform6X6_2.size.width / 2
        farmer.position.y = platform6X6_2.position.y + platform6X6_2.size.height / 2
    }
    if(randomChance == 3)
    {
        farmer.position.x = platform6X6_1.position.x - platform6X6_1.size.width / 2
        farmer.position.y = platform6X6_1.position.y + platform6X6_1.size.height / 2
    }
    
    
    //print("\(farmer.position.x) FARMER POSITION X HERE")
    //print("\(farmer.position.y) FARMER POSITION Y HERE")
    
    //print("\(platform12_1.position.x) PLATFORM12_1 POSITION X HERE")
    //print("\(platform12_1.position.y) PLATFORM12_1 POSITION Y HERE")
}
*/
