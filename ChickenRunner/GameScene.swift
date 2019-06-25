//
//  GameScene.swift
//  ChickenRunner
//
//  Created by Andrey Osokin on 2019-06-20.
//  Copyright © 2019 Andrey Osokin. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    let playableRect: CGRect
    
    var screenWidth = CGFloat()
    var screenHeight = CGFloat()
    
    var bg = SKSpriteNode()
    
    var randomNumber = Int.random(in: 150 ..< 300)
    var randomScale = CGFloat.random(in: 1 ..< 4)

    let cameraNode = SKCameraNode() // Camera Node
    var cameraMovePointsPerSec = Int(10) // start speed for camera
    
    
    let houseBg = SKSpriteNode(imageNamed: "house") // farm house
    let barn = SKSpriteNode(imageNamed: "barn") // barn
    let cloud_1 = SKSpriteNode(imageNamed: "cloud")
    let cloud_2 = SKSpriteNode(imageNamed: "cloud")
    //platforms are here
    let platform3X6 = SKSpriteNode(imageNamed: "platform3X6")

    
    override func didMove(to view: SKView) {
        

        addChild(cameraNode)
        camera = cameraNode
        cameraNode.position = CGPoint(x: size.width/2, y: size.height/2)
        
    
        
        for i in 0...1 {
            
            bg = backgroundNode()
            bg.anchorPoint = CGPoint.zero
            bg.position =
                CGPoint(x: CGFloat(i)*bg.size.width, y: 0)
            bg.name = "background"
            bg.zPosition = -100
            addChild(bg)
        }
        
        
        drawCloud_1(cloud_1: cloud_1, screenWidth: screenWidth, screenHeight: screenHeight)
        addChild(cloud_1)
        
        drawCloud_2(cloud_2: cloud_2, screenWidth: screenWidth, screenHeight: screenHeight)
        addChild(cloud_2)

        drawHouse(houseBg: houseBg, screenWidth: screenWidth, screenHeight: screenHeight)
        addChild(houseBg)
        
        drawBarn(barn: barn, screenWidth: screenWidth, screenHeight: screenHeight)
        addChild(barn)
        
        
        platform3X6.position = CGPoint(x: 500, y: 0 + platform3X6.size.height / 2)
        platform3X6.setScale(3)
        platform3X6.zPosition = 0
        addChild(platform3X6)
    }
    

    override init(size: CGSize) {
        let maxAspectRatio:CGFloat = 16.0/9.0 // 1
        let playableHeight = size.width / maxAspectRatio // 2
        let playableMargin = (size.height-playableHeight)/2.0 // 3
        
        playableRect = CGRect(x: 0, y: playableMargin,
                              width: size.width,
                              height: playableHeight) // 4
        
        screenWidth = size.width;
        screenHeight = size.height;
        
        super.init(size: size) // 5
        
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var cameraRect : CGRect {
        let x = cameraNode.position.x - size.width/2
            + (size.width - playableRect.width)/2
        let y = cameraNode.position.y - size.height/2
            + (size.height - playableRect.height)/2
        return CGRect(
            x: x,
            y: y,
            width: playableRect.width,
            height: playableRect.height)
    }
    
    
    
    func moveCamera() {

        cameraNode.position.x = cameraNode.position.x + CGFloat(cameraMovePointsPerSec)
        
        enumerateChildNodes(withName: "background") { node, _ in
            let background = node as! SKSpriteNode
            if background.position.x + background.size.width <
                self.cameraRect.origin.x {
                background.position = CGPoint(
                    x: background.position.x + background.size.width*2,
                    y: background.position.y)
            }
        }
        
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        
        moveCamera()
        moveClouds(cloud_1: cloud_1, cloud_2: cloud_2, barn: barn, cameraNode: cameraNode, cameraMovePointsPerSec: cameraMovePointsPerSec, screenHeight: screenHeight)
       
        print("\(cameraNode.position.x) camera X here")
        
    }
}

