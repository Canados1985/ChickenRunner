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
    let mySKView = SKView()
    
    
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
    let platform3X6_1 = SKSpriteNode(imageNamed: "platform3X6")
    let platform6X6_1 = SKSpriteNode(imageNamed: "platform6X6")
    let platform12X6_1 = SKSpriteNode(imageNamed: "platform12X6")
    let platform3X6_2 = SKSpriteNode(imageNamed: "platform3X6")
    let platform6X6_2 = SKSpriteNode(imageNamed: "platform6X6")
    let platform12X6_2 = SKSpriteNode(imageNamed: "platform12X6")
    
    //var player = Player()
    var touch = false
    
    //colision mask
    struct PhysicsCategory {
        static let None:       UInt32 = 0
        static let Platform:   UInt32 = 0b1 // 1
        static let Player:     UInt32 = 0b10 // 2
        static let Edge:     UInt32 = 0b100 // 4
      //  static let name:     UInt32 = 0b1000 // 8
      //  static let name:     UInt32 = 0b10000 // 16
      //  static let name:     UInt32 = 0b100000 // 32
      //  static let name:     UInt32 = 0b1000000 // 64
        
    }
    
    
    override func didMove(to view: SKView) {
        //Player
        PlayerTexture()
        mainPlayer.physicsBody?.collisionBitMask = PhysicsCategory.Player
        mainPlayer.physicsBody?.collisionBitMask = PhysicsCategory.Platform
        addChild(mainPlayer)
        
       
        
        
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
        
        
        drawPlatform3x6_1(platform3X6_1: platform3X6_1, screenWidth: screenWidth, screenHeight: screenHeight)
        platform3X6_1.physicsBody?.collisionBitMask = PhysicsCategory.Platform
        platform3X6_1.physicsBody?.collisionBitMask = PhysicsCategory.None
        addChild(platform3X6_1)
        
    
        drawPlatform6x6_1(platform6X6_1: platform6X6_1, screenWidth: screenWidth, screenHeight: screenHeight)
        platform6X6_1.physicsBody?.collisionBitMask = PhysicsCategory.Platform
        platform6X6_1.physicsBody?.collisionBitMask = PhysicsCategory.None
        addChild(platform6X6_1)
        
        
        drawPlatform12x6_1(platform12X6_1: platform12X6_1, screenWidth: screenWidth, screenHeight: screenHeight)
        platform12X6_1.physicsBody?.collisionBitMask = PhysicsCategory.Platform
        platform12X6_1.physicsBody?.collisionBitMask = PhysicsCategory.None
        addChild(platform12X6_1)
        
       
        
        drawPlatform3x6_2(platform3X6_2: platform3X6_2, screenWidth: screenWidth, screenHeight: screenHeight)
        platform3X6_2.physicsBody?.collisionBitMask = PhysicsCategory.Platform
        platform3X6_2.physicsBody?.collisionBitMask = PhysicsCategory.None
        addChild(platform3X6_2)
        
        
        drawPlatform6x6_2(platform6X6_2: platform6X6_2, screenWidth: screenWidth, screenHeight: screenHeight)
        platform6X6_2.physicsBody?.collisionBitMask = PhysicsCategory.Platform
        platform6X6_2.physicsBody?.collisionBitMask = PhysicsCategory.None
        addChild(platform6X6_2)
        
        
        drawPlatform12x6_2(platform12X6_2: platform12X6_2, screenWidth: screenWidth, screenHeight: screenHeight)
        platform12X6_2.physicsBody?.collisionBitMask = PhysicsCategory.Platform
        platform12X6_2.physicsBody?.collisionBitMask = PhysicsCategory.None
        addChild(platform12X6_2)
        
        

        
    }
    
    func PlayerIsOnGround(){
        //if mainPlayer.physicsBody?.usesPreciseCollisionDetection == true {
            
        //}
    }

    //##################################
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      
        touch = true
        print("it's clicking")
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touch = false
        print("it's not clicking anymore")
    }
    //##################################
    
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
    
    func AnimatePlayer(){
        mainPlayer.position.x = mainPlayer.position.x + 10
        //mainPlayer.run(SKAction .rotate(byAngle: -π / 4.0, duration: 1))
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        moveCamera()
        moveClouds(cloud_1: cloud_1, cloud_2: cloud_2, barn: barn, houseBG: houseBg, cameraNode: cameraNode, cameraMovePointsPerSec: cameraMovePointsPerSec, screenWidth: screenWidth, screenHeight: screenHeight)
       
        resetPlatformsHere(platform3X6_1: platform3X6_1, platform6X6_1: platform6X6_1, platform12X6_1: platform12X6_2, platform3X6_2: platform3X6_2, platform6X6_2: platform6X6_2, platform12X6_2: platform12X6_2, screenWidth: screenWidth, screenHeight: screenHeight, cameraNode: cameraNode)
        AnimatePlayer()
        
        if touch {
             mainPlayer.physicsBody!.applyImpulse(CGVector(dx: 0, dy: 200))
        }
        
        print("\(cameraNode.position.x) camera X here")
        
    }
}

