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
    
    let cameraNode = SKCameraNode() // Camera Node
    var cameraMovePointsPerSec = 10 // start speed for camera
    var bg = SKSpriteNode()
    
    var randomNumber = Int.random(in: 700 ..< 1200)
    let rnScale = CGFloat.random(in: 2 ..< 5)
    
    let cloudSprite1 = SKSpriteNode(imageNamed: "cloud")
    let cloudSprite2 = SKSpriteNode(imageNamed: "cloud")
    
    let player = SKSpriteNode(imageNamed: "player")
    
    override func didMove(to view: SKView) {
        
        addChild(cameraNode)
        camera = cameraNode
        cameraNode.position = CGPoint(x: size.width/2, y: size.height/2)
        
        player.position = CGPoint(x: size.width/2, y: size.height/2)
        player.setScale(5)
        addChild(player)
        
        for i in 0...1 {
            
            bg = backgroundNode()
            bg.anchorPoint = CGPoint.zero
            bg.position =
                CGPoint(x: CGFloat(i)*bg.size.width, y: 0)
            bg.name = "background"
            bg.zPosition = -100
            addChild(bg)
        }
        
       
        // Init cloud_1 on start
        
        cloudSprite1.setScale(rnScale)
        cloudSprite1.position = CGPoint(x: Int(playableRect.width) + (randomNumber), y: randomNumber)
        cloudSprite1.anchorPoint = CGPoint.zero
        cloudSprite1.zPosition = -5
        addChild(cloudSprite1)

        
        // Init cloud_2 on start
        //let rnScale = CGFloat.random(in: 1 ..< 3)
        randomNumber = Int.random(in: 700 ..< 1200)
        cloudSprite2.setScale(rnScale)
        cloudSprite2.position = CGPoint(x: Int(playableRect.width) + Int(randomNumber) * Int(rnScale), y: randomNumber)
        cloudSprite2.anchorPoint = CGPoint.zero
        cloudSprite2.zPosition = -5
        addChild(cloudSprite2)
        
    }
    
    
    override init(size: CGSize) {
        let maxAspectRatio:CGFloat = 16.0/9.0 // 1
        let playableHeight = size.width / maxAspectRatio // 2
        let playableMargin = (size.height-playableHeight)/2.0 // 3
        
        playableRect = CGRect(x: 0, y: playableMargin,
                              width: size.width,
                              height: playableHeight) // 4
        
        super.init(size: size) // 5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func moveCloud()
    {
        //Reset cloud 1 here
        if(cloudSprite1.position.x < cameraNode.position.x - cloudSprite1.size.width * 3)
        {
            let rn = Int.random(in: 700 ..< 1200)
            let rnScale = CGFloat.random(in: 2 ..< 4)
            
            cloudSprite1.setScale(rnScale)
            cloudSprite1.position = CGPoint(x: Int(cameraNode.position.x) + Int(cloudSprite1.size.width) * 2, y: rn)
        }
        //Reset cloud 2 here
        if(cloudSprite2.position.x < cameraNode.position.x - cloudSprite2.size.width * 4)
        {
            let rn = Int.random(in: 700 ..< 1200)
            //let rnScale = CGFloat.random(in: 1 ..< 3)
            
            cloudSprite2.setScale(rnScale)
            cloudSprite2.position = CGPoint(x: Int(cameraNode.position.x) + Int(cloudSprite2.size.width * rnScale), y: rn)
        }
        
        
        cloudSprite1.position.x -= CGFloat(cameraMovePointsPerSec + 2)
        cloudSprite2.position.x -= CGFloat(cameraMovePointsPerSec + 4)
        
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
        
        
        moveCloud()
        moveCamera()
        
        
        print("\(playableRect.width) playable rect X here")
        
        print("\(cameraNode.position.x) camera position X here")
        print("\(cloudSprite1.position.x) cloud X here")
        print("\(randomNumber) random number")
        
    }
}
