//
//  Platforms.swift
//  ChickenRunner
//
//  Created by Andrey Osokin on 2019-06-24.
//  Copyright © 2019 Andrey Osokin. All rights reserved.
//

import SpriteKit

var rGap = Int() // Distance between platforms
var rHeight = Int() // Height of the platrom
var rIndex = Int() //Index for random

var collisionMask = SKPhysicsBody()
var tempCameraPosition = Int();


//PLATFORM 3X6 _1 SECOND ONE 
func drawPlatform3x6_1(platform3X6_1: SKSpriteNode, platform3X6_2: SKSpriteNode, platform6X6_1: SKSpriteNode, platform6X6_2: SKSpriteNode, screenWidth: CGFloat, screenHeight: CGFloat)
{
    
    rGap = Int.random(in: 50 ..< 150)
    rHeight = Int.random(in: -100 ..< 10)
    rIndex = Int.random(in: 2 ..< 4)

    
    platform3X6_1.position = CGPoint(x: Int(platform6X6_1.position.x + platform6X6_1.size.width) + rGap, y: Int(screenHeight / 2 - platform3X6_1.size.height * 2) + rHeight)
    
    platform3X6_1.setScale(2)
    platform3X6_1.zPosition = 0
    
    platform3X6_1.physicsBody = SKPhysicsBody(rectangleOf: platform3X6_1.size)
    platform3X6_1.physicsBody?.affectedByGravity = false;
    platform3X6_1.physicsBody?.isDynamic = false

}

//PLATFORM 3X6 _2 LAST ONE
func drawPlatform3x6_2(platform3X6_1: SKSpriteNode, platform3X6_2: SKSpriteNode, platform6X6_1: SKSpriteNode, platform6X6_2: SKSpriteNode, screenWidth: CGFloat, screenHeight: CGFloat)
{
    rGap = Int.random(in: 50 ..< 100)
    rHeight = Int.random(in: -100 ..< 10)
    rIndex = Int.random(in: 2 ..< 4)
    
    platform3X6_2.position = CGPoint(x: Int(platform6X6_2.position.x + platform6X6_2.size.width) + rGap, y: Int(screenHeight / 2 - platform3X6_2.size.height * 2) + rHeight)

    platform3X6_2.setScale(2)
    platform3X6_2.zPosition = 0
    
    platform3X6_2.physicsBody = SKPhysicsBody(rectangleOf: platform3X6_2.size)
    platform3X6_2.physicsBody?.affectedByGravity = false;
    platform3X6_2.physicsBody?.isDynamic = false
}


//PLATFORM 6X6 _1 FIRST ONE ON FIRST CALL
func drawPlatform6x6_1(platform3X6_1: SKSpriteNode, platform3X6_2: SKSpriteNode, platform6X6_1: SKSpriteNode, platform6X6_2: SKSpriteNode, screenWidth: CGFloat, screenHeight: CGFloat)
{
    rGap = Int.random(in: 0 ..< 100)
    rHeight = Int.random(in: -100 ..< 50)
    rIndex = Int.random(in: 1 ..< 3)
    
    platform6X6_1.position = CGPoint(x: 0 + rGap, y: Int(screenHeight / 2 - platform6X6_1.size.height * 2) + rHeight)
    
    platform6X6_1.setScale(2)
    platform6X6_1.zPosition = 0
    
    platform6X6_1.physicsBody = SKPhysicsBody(rectangleOf: platform6X6_1.size)
    platform6X6_1.physicsBody?.affectedByGravity = false;
    platform6X6_1.physicsBody?.isDynamic = false
    
}

//PLATFORM 6X6 _2 THIRD ONE
func drawPlatform6x6_2(platform3X6_1: SKSpriteNode, platform3X6_2: SKSpriteNode, platform6X6_1: SKSpriteNode, platform6X6_2: SKSpriteNode, screenWidth: CGFloat, screenHeight: CGFloat)
{
    rGap = Int.random(in: 100 ..< 500)
    rHeight = Int.random(in: -100 ..< 50)
    rIndex = Int.random(in: 1 ..< 3)
    
    platform6X6_2.position = CGPoint(x: Int(platform3X6_1.position.x + platform3X6_1.size.width) + rGap, y: Int(screenHeight / 2 - platform6X6_2.size.height * 2) + rHeight)
    
    platform6X6_2.setScale(2)
    platform6X6_2.zPosition = 0
    
    platform6X6_2.physicsBody = SKPhysicsBody(rectangleOf: platform6X6_2.size)
    platform6X6_2.physicsBody?.affectedByGravity = false;
    platform6X6_2.physicsBody?.isDynamic = false
}

/*
//PLATFORM 12X6 _1
func drawPlatform12x6_1(platform12X6_1: SKSpriteNode, screenWidth: CGFloat, screenHeight: CGFloat)
{
    rGap = Int.random(in: 500 ..< 1500)
    rHeight = Int.random(in: -100 ..< 100)
    rIndex = Int.random(in: 1 ..< 3)
    
    platform12X6_1.position = CGPoint(x: 0, y: screenHeight / 2 - platform12X6_1.size.height * 2)
    
    
    platform12X6_1.setScale(2)
    platform12X6_1.zPosition = 0
    
    platform12X6_1.physicsBody = SKPhysicsBody(rectangleOf: platform12X6_1.size)
    platform12X6_1.physicsBody?.affectedByGravity = false
    platform12X6_1.physicsBody?.isDynamic = false
    
}


//PLATFORM 12X6 _2
func drawPlatform12x6_2(platform12X6_2: SKSpriteNode, screenWidth: CGFloat, screenHeight: CGFloat)
{
    rGap = Int.random(in: 500 ..< 1500)
    rHeight = Int.random(in: -100 ..< 100)
    rIndex = Int.random(in: 1 ..< 3)
    
    platform12X6_2.position = CGPoint(x: 0, y: screenHeight / 2 - platform12X6_2.size.height * 2)
    
    platform12X6_2.setScale(2)
    platform12X6_2.zPosition = 0
    
    
    platform12X6_2.physicsBody = SKPhysicsBody(rectangleOf: platform12X6_2.size)
    platform12X6_2.physicsBody?.affectedByGravity = false;
    platform12X6_2.physicsBody?.isDynamic = false
}
*/


//RESET PLATFORMS HERE ***************************
func resetPlatformsHere(platform3X6_1: SKSpriteNode, platform6X6_1: SKSpriteNode,  platform12X6_1: SKSpriteNode, platform3X6_2: SKSpriteNode, platform6X6_2: SKSpriteNode,  platform12X6_2: SKSpriteNode, screenWidth: CGFloat, screenHeight: CGFloat, cameraNode: SKCameraNode, cameraRect: CGRect, enemyFarmer: SKSpriteNode)
{
    
    
    
 /*   //RESET PLATFORM 12X6 _1
    if(Int(platform12X6_1.position.x) < Int(cameraNode.position.x - platform12X6_1.size.width))
    {
        
        rGap = Int.random(in: 500 ..< 1500)
        rHeight = Int.random(in: -50 ..< 200)
        rIndex = Int.random(in: 1 ..< 3)
        
        platform12X6_1.position = CGPoint(x: Int(platform12X6_1.position.x) * 2, y: Int(screenHeight / 2))
        
       
        print("RESET PLATFROM 12X6 HERE")
    }
    
    
    //RESET PLATFORM 12X6 _2
    if(Int(platform12X6_2.position.x) < Int(cameraRect.width - platform12X6_2.size.width) - rGap)
    {
        
        rGap = Int.random(in: 500 ..< 1500)
        rHeight = Int.random(in: -50 ..< 200)
        rIndex = Int.random(in: 1 ..< 3)
        
        platform12X6_2.position = CGPoint(x: Int(cameraNode.position.x) + Int(screenWidth), y: Int(screenHeight / 2 - platform12X6_2.size.height) + rHeight)

    }
    */
    
    //RESET PLATFORM 6X6 _1 BASED ON PLATFORM 3X6_2
    if(Int(platform6X6_1.position.x) < Int(cameraNode.position.x - cameraRect.size.width / 2 - platform6X6_1.size.width / 2))
    {
        
        rGap = Int.random(in: 100 ..< 150)
        rHeight = Int.random(in: -50 ..< 100)
        rIndex = Int.random(in: 1 ..< 3)
        
        //RESET PLATFORM BASED ON LAST CALL PLATFORM 3X6_2
        platform6X6_1.position = CGPoint(x: Int(platform3X6_2.position.x + platform3X6_2.size.width) + rGap, y: Int(screenHeight / 2 - platform6X6_1.size.height))
        
        
        randomChance = Int.random(in: 0 ..< 3)
        if(randomChance > 1 && Int(enemyFarmer.position.x) < Int(cameraNode.position.x - cameraRect.size.width / 2 - enemyFarmer.size.width / 2))
        {
            enemyFarmer.position = CGPoint(x: platform6X6_1.position.x - platform6X6_1.size.width / 2, y: platform6X6_1.position.y + platform6X6_1.size.height / 2)
        }
       
        print("RESET PLATFROM 6X6_1 HERE")
        //print("\(platform6X6_1.position.x) PLATFORM 6X6 X here")
        //print("\(platform6X6_1.position.y) PLATFORM 6X6 Y here")
    }
    
    
    //RESET PLATFORM 3X6_1 BASED ON PLATFORM 6X6 _2
    if(Int(platform3X6_1.position.x) < Int(cameraNode.position.x - cameraRect.size.width / 2 - platform3X6_1.size.width / 2))
    {
        
        rGap = Int.random(in: 100 ..< 150)
        rHeight = Int.random(in: -50 ..< 100)
        rIndex = Int.random(in: 1 ..< 3)
        
        platform3X6_1.position = CGPoint(x: Int(platform6X6_1.position.x + platform6X6_1.size.width) + rGap, y: Int(screenHeight / 2 - platform3X6_1.size.height))
        
        print("RESET PLATFROM 3X6_1 HERE")
    }
    
    //RESET PLATFORM 6X6_2 BASED ON 3X6_1
    if(Int(platform6X6_2.position.x) < Int(cameraNode.position.x - cameraRect.size.width / 2 - platform6X6_2.size.width / 2))
    {
        
        rGap = Int.random(in: 100 ..< 150)
        rHeight = Int.random(in: -50 ..< 100)
        rIndex = Int.random(in: 1 ..< 3)
        randomChance = 3
        
        
        platform6X6_2.position = CGPoint(x: Int(platform3X6_1.position.x + platform3X6_1.size.width) + rGap, y: Int(screenHeight / 2 - platform6X6_2.size.height) + rHeight)
        
        
        randomChance = Int.random(in: 0 ..< 3)
        if(randomChance > 1 && Int(enemyFarmer.position.x) < Int(cameraNode.position.x - cameraRect.size.width / 2 - enemyFarmer.size.width / 2))
        {
            enemyFarmer.position = CGPoint(x: platform6X6_2.position.x - platform6X6_2.size.width / 2, y: platform6X6_2.position.y + platform6X6_2.size.height / 2)
        }
        

        print("RESET PLATFROM 6X6_2 HERE")
    }

    
    //RESET PLATFORM 3X6_2 BASED ON PLATFORM 6X6_2
    if(Int(platform3X6_2.position.x) < Int(cameraNode.position.x - cameraRect.size.width / 2 - platform3X6_2.size.width / 2))
    {
        
        rGap = Int.random(in: 100 ..< 150)
        rHeight = Int.random(in: -50 ..< 100)
        rIndex = Int.random(in: 1 ..< 3)
        
        
        platform3X6_2.position = CGPoint(x: Int(platform6X6_2.position.x + platform6X6_2.size.width) + rGap, y: Int(screenHeight / 2 - platform3X6_2.size.height))

        print("RESET PLATFROM 3X6_2 HERE")
    }
    
    //platform12X6_1.physicsBody?.linearDamping = 5
    
    //print("\(platform12X6_1.position.x) PLATFORM 12X6 X here")
    //print("\(platform6X6_1.position.x + platform6X6_1.size.width) PLATFORM 6X6 x + WIDTH here")
    
    
    
    
}
