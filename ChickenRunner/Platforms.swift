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

var tempPlatform3X6PositionX = CGFloat()
var tempPlatform3X6PositionY = CGFloat()

var tempPlatform6X6PositionX = CGFloat()
var tempPlatform6X6PositionY = CGFloat()

var tempPlatform12X6PositionX = CGFloat()
var tempPlatform12X6PositionY = CGFloat()

var tempPlatform3X6PositionX_2 = CGFloat()
var tempPlatform3X6PositionY_2 = CGFloat()

var tempPlatform6X6PositionX_2 = CGFloat()
var tempPlatform6X6PositionY_2 = CGFloat()

var tempPlatform12X6PositionX_2 = CGFloat()
var tempPlatform12X6PositionY_2 = CGFloat()

var collisionMask = SKPhysicsBody()

//PLATFORM 3X6 _1
func drawPlatform3x6_1(platform3X6_1: SKSpriteNode, screenWidth: CGFloat, screenHeight: CGFloat)
{
    rGap = Int.random(in: 250 ..< 1000)
    rHeight = Int.random(in: -100 ..< 200)
    rIndex = Int.random(in: 1 ..< 3)

    platform3X6_1.position = CGPoint(x: Int(tempPlatform12X6PositionX) + rGap * rIndex , y: Int(screenHeight / 2 - platform3X6_1.size.height * 2) + rHeight)
    
    tempPlatform3X6PositionX = platform3X6_1.position.x
    tempPlatform3X6PositionY = platform3X6_1.position.y
    
    platform3X6_1.setScale(2)
    platform3X6_1.zPosition = 0
    
    platform3X6_1.physicsBody = SKPhysicsBody(rectangleOf: platform3X6_1.size)
    platform3X6_1.physicsBody?.affectedByGravity = false;

    
    
}

//PLATFORM 3X6 _2
func drawPlatform3x6_2(platform3X6_2: SKSpriteNode, screenWidth: CGFloat, screenHeight: CGFloat)
{
    rGap = Int.random(in: 250 ..< 1000)
    rHeight = Int.random(in: -100 ..< 200)
    rIndex = Int.random(in: 1 ..< 3)
    
    platform3X6_2.position = CGPoint(x: Int(screenWidth) + rGap * rIndex , y: Int(screenHeight / 2 - platform3X6_2.size.height * 2) + rHeight)
    
    tempPlatform3X6PositionX_2 = platform3X6_2.position.x
    tempPlatform3X6PositionY_2 = platform3X6_2.position.y
    
    platform3X6_2.setScale(2)
    platform3X6_2.zPosition = 0
    
    platform3X6_2.physicsBody = SKPhysicsBody(rectangleOf: platform3X6_2.size)
    platform3X6_2.physicsBody?.affectedByGravity = false;
}


//PLATFORM 6X6 _1
func drawPlatform6x6_1(platform6X6_1: SKSpriteNode, screenWidth: CGFloat, screenHeight: CGFloat)
{
    rGap = Int.random(in: 500 ..< 1500)
    rHeight = Int.random(in: -100 ..< 100)
    rIndex = Int.random(in: 1 ..< 3)
    
    platform6X6_1.position = CGPoint(x: Int(tempPlatform12X6PositionX) + rGap * 2 * rIndex, y: Int(screenHeight / 2 - platform6X6_1.size.height * 2) + rHeight)
    
    tempPlatform6X6PositionX = platform6X6_1.position.x
    tempPlatform6X6PositionY = platform6X6_1.position.y
    
    platform6X6_1.setScale(2)
    platform6X6_1.zPosition = 0
    
    platform6X6_1.physicsBody = SKPhysicsBody(rectangleOf: platform6X6_1.size)
    platform6X6_1.physicsBody?.affectedByGravity = false;
    
    
}

//PLATFORM 6X6 _2
func drawPlatform6x6_2(platform6X6_2: SKSpriteNode, screenWidth: CGFloat, screenHeight: CGFloat)
{
    rGap = Int.random(in: 500 ..< 1500)
    rHeight = Int.random(in: -100 ..< 100)
    rIndex = Int.random(in: 1 ..< 3)
    
    platform6X6_2.position = CGPoint(x: Int(screenWidth / 2) + rGap * rIndex, y: Int(screenHeight / 2 - platform6X6_2.size.height * 2) + rHeight)
    
    tempPlatform6X6PositionX_2 = platform6X6_2.position.x
    tempPlatform6X6PositionY_2 = platform6X6_2.position.y
    
    platform6X6_2.setScale(2)
    platform6X6_2.zPosition = 0
    
    platform6X6_2.physicsBody = SKPhysicsBody(rectangleOf: platform6X6_2.size)
    platform6X6_2.physicsBody?.affectedByGravity = false;
}


//PLATFORM 12X6 _1
func drawPlatform12x6_1(platform12X6_1: SKSpriteNode, screenWidth: CGFloat, screenHeight: CGFloat)
{
    rGap = Int.random(in: 500 ..< 1500)
    rHeight = Int.random(in: -100 ..< 100)
    rIndex = Int.random(in: 1 ..< 3)
    
    platform12X6_1.position = CGPoint(x: 0, y: screenHeight / 2 - platform12X6_1.size.height * 2)
    
    tempPlatform12X6PositionX = platform12X6_1.position.x
    tempPlatform12X6PositionY = platform12X6_1.position.y
    
    platform12X6_1.setScale(2)
    platform12X6_1.zPosition = 0
    
    platform12X6_1.physicsBody = SKPhysicsBody(rectangleOf: platform12X6_1.size)
    platform12X6_1.physicsBody?.affectedByGravity = false
    
}


//PLATFORM 12X6 _2
func drawPlatform12x6_2(platform12X6_2: SKSpriteNode, screenWidth: CGFloat, screenHeight: CGFloat)
{
    rGap = Int.random(in: 500 ..< 1500)
    rHeight = Int.random(in: -100 ..< 100)
    rIndex = Int.random(in: 1 ..< 3)
    
    platform12X6_2.position = CGPoint(x: 0, y: screenHeight / 2 - platform12X6_2.size.height * 2)
    
    tempPlatform12X6PositionX_2 = platform12X6_2.position.x
    tempPlatform12X6PositionY_2 = platform12X6_2.position.y
    
    platform12X6_2.setScale(2)
    platform12X6_2.zPosition = 0
    
    
    platform12X6_2.physicsBody = SKPhysicsBody(rectangleOf: platform12X6_2.size)
    platform12X6_2.physicsBody?.affectedByGravity = false;
}




//RESET PLATFORMS HERE
func resetPlatformsHere(platform3X6_1: SKSpriteNode, platform6X6_1: SKSpriteNode,  platform12X6_1: SKSpriteNode, platform3X6_2: SKSpriteNode, platform6X6_2: SKSpriteNode,  platform12X6_2: SKSpriteNode, screenWidth: CGFloat, screenHeight: CGFloat, cameraNode: SKCameraNode)
{
    //RESET PLATFORM 12X6 _1
    if(Int(platform12X6_1.position.x) < Int(cameraNode.position.x - platform12X6_1.size.width) - rGap)
    {
        
        rGap = Int.random(in: 500 ..< 1500)
        rHeight = Int.random(in: -50 ..< 200)
        rIndex = Int.random(in: 1 ..< 3)
        
        platform12X6_1.position = CGPoint(x: Int(cameraNode.position.x) + Int(screenWidth) + rGap, y: Int(screenHeight / 2 - platform12X6_1.size.height) + rHeight)
        
        tempPlatform12X6PositionX = platform12X6_1.position.x
        tempPlatform12X6PositionY = platform12X6_1.position.y
        
        //print("RESET PLATFROM 12X6 HERE")
    }
    
    
    //RESET PLATFORM 12X6 _2
    if(Int(platform12X6_2.position.x) < Int(cameraNode.position.x - platform12X6_2.size.width) - rGap)
    {
        
        rGap = Int.random(in: 500 ..< 1500)
        rHeight = Int.random(in: -50 ..< 200)
        rIndex = Int.random(in: 1 ..< 3)
        
        platform12X6_2.position = CGPoint(x: Int(cameraNode.position.x) + Int(screenWidth), y: Int(screenHeight / 2 - platform12X6_2.size.height) + rHeight)
        
        tempPlatform12X6PositionX_2 = platform12X6_2.position.x
        tempPlatform12X6PositionY_2 = platform12X6_2.position.y
        
        
    }
    
    
    //RESET PLATFORM 6X6 _1
    if(platform6X6_1.position.x < cameraNode.position.x - platform6X6_1.size.width * 2)
    {
        
        rGap = Int.random(in: 500 ..< 1500)
        rHeight = Int.random(in: -50 ..< 500)
        rIndex = Int.random(in: 1 ..< 3)
        
        platform6X6_1.position = CGPoint(x: Int(cameraNode.position.x) + Int(screenWidth), y: Int(screenHeight / 2 - platform6X6_1.size.height))
        
        tempPlatform6X6PositionX = platform6X6_1.position.x
        tempPlatform6X6PositionY = platform6X6_1.position.y
        
        //print("RESET PLATFROM 6X6 HERE")
    }
    
    //RESET PLATFORM 6X6 _2
    if(platform6X6_2.position.x < cameraNode.position.x - platform6X6_2.size.width * 2)
    {
        
        rGap = Int.random(in: 500 ..< 1500)
        rHeight = Int.random(in: -50 ..< 500)
        rIndex = Int.random(in: 1 ..< 3)
        
        platform6X6_2.position = CGPoint(x: Int(cameraNode.position.x) + Int(screenHeight) + rGap, y: Int(screenHeight / 2 - platform6X6_2.size.height) + rHeight)
        
        tempPlatform6X6PositionX_2 = platform6X6_2.position.x
        tempPlatform6X6PositionY_2 = platform6X6_2.position.y
        
        //print("RESET PLATFROM 6X6 HERE")
    }
    
    //RESET PLATFORM 3X6 _1
    if(platform3X6_1.position.x < cameraNode.position.x - platform3X6_1.size.width * 3)
    {
        
        rGap = Int.random(in: 500 ..< 1500)
        rHeight = Int.random(in: -50 ..< 500)
        rIndex = Int.random(in: 1 ..< 3)
        
        platform3X6_1.position = CGPoint(x: cameraNode.position.x + tempPlatform6X6PositionX * 2, y: screenHeight / 2 - platform3X6_1.size.height)
        
        tempPlatform3X6PositionX = platform3X6_1.position.x
        tempPlatform3X6PositionY = platform3X6_1.position.y
        
        //print("RESET PLATFROM 3X6 HERE")
    }
    
    //RESET PLATFORM 3X6 _2
    if(platform3X6_2.position.x < cameraNode.position.x - platform3X6_2.size.width * 3)
    {
        
        rGap = Int.random(in: 500 ..< 1500)
        rHeight = Int.random(in: -50 ..< 500)
        rIndex = Int.random(in: 1 ..< 3)
        
        platform3X6_2.position = CGPoint(x: cameraNode.position.x + screenWidth, y: screenHeight / 2 - platform3X6_2.size.height)
        
        tempPlatform3X6PositionX_2 = platform3X6_2.position.x
        tempPlatform3X6PositionY_2 = platform3X6_2.position.y
        
        //print("RESET PLATFROM 3X6 HERE")
    }
    
    //platform12X6_1.physicsBody?.linearDamping = 5
    
    //print("\(platform12X6_1.position.x) PLATFORM 12X6 X here")
}
