//
//  Background.swift
//  ChickenRunner
//
//  Created by Andrey Osokin on 2019-06-20.
//  Copyright © 2019 Andrey Osokin. All rights reserved.
//
import SpriteKit

var randomNumber = Int.random(in: 700 ..< 1200)
var randomScale = CGFloat.random(in: 1 ..< 4)
var randomHeight = Int.random(in: -100 ..< 100)

var speed_Cloud_1 = Int()
var speed_Cloud_2 = Int()


func backgroundNode() -> SKSpriteNode {
    // 1
    let bgNode = SKSpriteNode()
    bgNode.anchorPoint = CGPoint.zero
    bgNode.name = "background"
    randomScale = CGFloat.random(in: 0 ..< 4)
    
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


func drawCloud_1(cloud_1: SKSpriteNode, screenWidth: CGFloat, screenHeight: CGFloat)
{
    
    cloud_1.anchorPoint = CGPoint.zero
    randomScale = CGFloat.random(in: 1 ..< 4)
    cloud_1.setScale(randomScale)
    randomNumber = Int.random(in: 700 ..< 1200)
    randomHeight = Int.random(in: -100 ..< 100)
    speed_Cloud_1 = Int(randomScale)
    cloud_1.position = CGPoint(x: Int(screenWidth + cloud_1.size.width) + randomNumber, y: Int(screenHeight / 2) + Int(randomHeight))
    cloud_1.zPosition = -50
}

func drawCloud_2(cloud_2: SKSpriteNode, screenWidth: CGFloat, screenHeight: CGFloat)
{
    
    cloud_2.anchorPoint = CGPoint.zero
    randomScale = CGFloat.random(in: 1 ..< 4)
    cloud_2.setScale(randomScale)
    randomNumber = Int.random(in: 700 ..< 1200)
    randomHeight = Int.random(in: -100 ..< 100)
    speed_Cloud_2 = Int(randomScale)
    cloud_2.position = CGPoint(x: Int(screenWidth + cloud_2.size.width * 3) + randomNumber, y: Int(screenHeight / 2) + Int(randomHeight))
    cloud_2.zPosition = -50
}


func drawBarn(barn: SKSpriteNode, screenWidth: CGFloat, screenHeight: CGFloat)
{
    //house sprite
    barn.position = CGPoint(x: screenWidth + barn.size.width * 2, y: screenHeight/2 + barn.size.height / 3)
    barn.setScale(2)
    barn.zPosition = -50
}

func drawHouse(houseBg: SKSpriteNode, screenWidth: CGFloat, screenHeight: CGFloat)
{
    //house sprite
    houseBg.position = CGPoint(x: screenWidth / 2 - houseBg.size.width, y: screenHeight / 2 + houseBg.size.height)
    houseBg.setScale(2)
    houseBg.zPosition = -60
}


func moveClouds(cloud_1: SKSpriteNode, cloud_2: SKSpriteNode, barn: SKSpriteNode, houseBG: SKSpriteNode, cameraNode: SKCameraNode, cameraMovePointsPerSec: Int, screenWidth: CGFloat, screenHeight: CGFloat)
{
   
    //Reset cloud 1 here
    if(cloud_1.position.x < cameraNode.position.x - cloud_1.size.width * 4)
    {

        randomScale = CGFloat.random(in: 1 ..< 4)
        cloud_1.setScale(randomScale)
        randomNumber = Int.random(in: 700 ..< 1200)
        randomHeight = Int.random(in: -100 ..< 100)
        speed_Cloud_1 = Int(randomScale)
        cloud_1.position = CGPoint(x: Int(cameraNode.position.x * 2), y: Int(screenHeight / 2) + Int(randomHeight))

    }
    //Reset cloud 2 here
    if(cloud_2.position.x < cameraNode.position.x - cloud_2.size.width * 4)
    {
        
        randomScale = CGFloat.random(in: 1 ..< 4)
        cloud_2.setScale(randomScale)
        randomNumber = Int.random(in: 700 ..< 1200)
        randomHeight = Int.random(in: -100 ..< 100)
        speed_Cloud_2 = Int(randomScale)
        cloud_2.position = CGPoint(x: Int(cameraNode.position.x * 2), y: Int(screenHeight / 2) + Int(randomHeight))
        
    }
    
    //Reset barn here
    if(cameraNode.position.x > barn.position.x + barn.size.width * 3)
    {
        
        randomNumber = Int.random(in: 700 ..< 1200)
        randomHeight = Int.random(in: -100 ..< 100)
        
        barn.position = CGPoint(x: cameraNode.position.x + barn.size.width * 2, y: screenHeight/2 + barn.size.height / 3)
        barn.setScale(2)
    }
    
    //Reset house here
    if(cameraNode.position.x > houseBG.position.x + houseBG.size.width * 3)
    {
        
        randomNumber = Int.random(in: 700 ..< 1200)
        randomHeight = Int.random(in: -100 ..< 100)
        
        houseBG.position = CGPoint(x: cameraNode.position.x + houseBG.size.width * 5, y: screenHeight / 2 - houseBG.size.height)
        houseBG.setScale(2)
    }
    
    
    
    cloud_1.position.x -= CGFloat(cameraMovePointsPerSec / speed_Cloud_1)
    cloud_2.position.x -= CGFloat(cameraMovePointsPerSec / speed_Cloud_2)
    
    barn.position.x -= CGFloat(Double(cameraMovePointsPerSec) / 50)
    houseBG.position.x -= CGFloat(Double(cameraMovePointsPerSec) / 50)
    
    //houseBg.position.x -= CGFloat(cameraMovePointsPerSec) + 0.25
    //barn.position.x -= CGFloat(cameraMovePointsPerSec) + 0.45
    //print("\(cameraNode.position.x) camera position X here")
    //print("\(barn.position.x) BARN X here")
    //print("\(cloud_2.position.x) cloud_2 X here")
    
}


 

 
 








