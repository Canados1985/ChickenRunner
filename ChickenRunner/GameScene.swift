//
//  GameScene.swift
//  ChickenRunner
//
//  Created by Andrey Osokin on 2019-06-20.
//  Copyright © 2019 Andrey Osokin. All rights reserved.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene ,SKPhysicsContactDelegate{

    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    let playableRect: CGRect
    let mySKView = SKView()
    
    var screenWidth = CGFloat()
    var screenHeight = CGFloat()
    
    var bg = SKSpriteNode()
    var bg_trees = SKSpriteNode()
    
    var randomNumber = Int.random(in: 150 ..< 300)
    var randomScale = CGFloat.random(in: 1 ..< 4)

    let cameraNode = SKCameraNode() // Camera Node
    
    var cameraMovePointsPerSec = Int(10) // start speed for camera
    
    
    let playerslifeLabel = SKLabelNode(fontNamed: "ComicKings")
    
    let houseBg = SKSpriteNode(imageNamed: "house") // farm house
    let barn = SKSpriteNode(imageNamed: "barn") // barn
    let cloud_1 = SKSpriteNode(imageNamed: "cloud")
    let cloud_2 = SKSpriteNode(imageNamed: "cloud")
    let sun = SKSpriteNode(imageNamed: "sun_")
    //platforms are here
    let platform3X6_1 = SKSpriteNode(imageNamed: "platform3X6")
    let platform6X6_1 = SKSpriteNode(imageNamed: "platform6X6")
    let platform12X6_1 = SKSpriteNode(imageNamed: "platform12X6")
    let platform3X6_2 = SKSpriteNode(imageNamed: "platform3X6")
    let platform6X6_2 = SKSpriteNode(imageNamed: "platform6X6")
    let platform12X6_2 = SKSpriteNode(imageNamed: "platform12X6")
    
    let enemyFarmer = SKSpriteNode(imageNamed: "enemy_farmer")
    
    //var player = Player()
    var touch = false
    var canJump = true
    
    let chickenMovePerSec : CGFloat = 200.0
    
    //colision mask
    struct PhysicsCategory {
        static let None:       UInt32 = 0
        static let Platform:   UInt32 = 0b1 // 1
        static let Player:     UInt32 = 0b10 // 2
        static let Chicken:    UInt32 = 0b100 // 4
      //  static let name:     UInt32 = 0b1000 // 8
      //  static let name:     UInt32 = 0b10000 // 16
      //  static let name:     UInt32 = 0b100000 // 32
      //  static let name:     UInt32 = 0b1000000 // 64
        
    }
    
    
    override func didMove(to view: SKView) {
        
        physicsWorld.contactDelegate = self
        //Player
        PlayerTexture()
        mainPlayer.physicsBody?.categoryBitMask = PhysicsCategory.Player
        mainPlayer.physicsBody?.collisionBitMask = PhysicsCategory.Platform
        mainPlayer.physicsBody?.contactTestBitMask = PhysicsCategory.Platform

        addChild(mainPlayer)
        
       //Second
        //spawnChicken()
        run(SKAction.repeatForever(
            SKAction.sequence([SKAction.run() { [weak self] in
            self?.spawnChicken()
            },
            SKAction.wait(forDuration: 5.0)])))

        //addChild(chickenPlayer)
        
        addChild(cameraNode)
        camera = cameraNode
        cameraNode.position = CGPoint(x: size.width/2, y: size.height/2)
        
        physicsWorld.contactDelegate = self
        
        for i in 0...1 {
            
            bg = backgroundNode()
            bg.anchorPoint = CGPoint.zero
            bg.position =
                CGPoint(x: CGFloat(i)*bg.size.width, y: 0)
            bg.name = "background"
            bg.zPosition = -100
            addChild(bg)
        }
        
       
        
        drawSun(sun: sun, screenWidth: screenWidth, screenHeight: screenHeight)
        addChild(sun)
        
        drawCloud_1(cloud_1: cloud_1, screenWidth: screenWidth, screenHeight: screenHeight)
        addChild(cloud_1)
        
        drawCloud_2(cloud_2: cloud_2, screenWidth: screenWidth, screenHeight: screenHeight)
        addChild(cloud_2)


        drawHouse(houseBg: houseBg, screenWidth: screenWidth, screenHeight: screenHeight)
        addChild(houseBg)
        drawBarn(barn: barn, screenWidth: screenWidth, screenHeight: screenHeight)
        addChild(barn)
        
        
        drawPlatform6x6_1(platform3X6_1: platform3X6_1, platform3X6_2: platform3X6_2, platform6X6_1: platform6X6_1, platform6X6_2: platform6X6_2, screenWidth: screenWidth, screenHeight: screenHeight)
        platform6X6_1.physicsBody?.categoryBitMask = PhysicsCategory.Platform
        platform6X6_1.physicsBody?.collisionBitMask = PhysicsCategory.Player
        platform6X6_1.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        addChild(platform6X6_1)
        
        
        drawPlatform3x6_1(platform3X6_1: platform3X6_1, platform3X6_2: platform3X6_2, platform6X6_1: platform6X6_1, platform6X6_2: platform6X6_2, screenWidth: screenWidth, screenHeight: screenHeight)
        platform3X6_1.physicsBody?.categoryBitMask = PhysicsCategory.Platform
        platform3X6_1.physicsBody?.collisionBitMask = PhysicsCategory.Player
        platform3X6_1.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        addChild(platform3X6_1)
        
        
        
        drawPlatform6x6_2(platform3X6_1: platform3X6_1, platform3X6_2: platform3X6_2, platform6X6_1: platform6X6_1, platform6X6_2: platform6X6_2, screenWidth: screenWidth, screenHeight: screenHeight)
        platform6X6_2.physicsBody?.categoryBitMask = PhysicsCategory.Platform
        platform6X6_2.physicsBody?.collisionBitMask = PhysicsCategory.Player
        platform6X6_2.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        addChild(platform6X6_2)

        
        
       // drawPlatform12x6_1(platform12X6_1: platform12X6_1, screenWidth: screenWidth, screenHeight: screenHeight)
       platform12X6_1.physicsBody?.categoryBitMask = PhysicsCategory.Platform
        platform12X6_1.physicsBody?.collisionBitMask = PhysicsCategory.Player
        platform12X6_1.physicsBody?.contactTestBitMask = PhysicsCategory.Player

        //addChild(platform12X6_1)
        
       
        
        drawPlatform3x6_2(platform3X6_1: platform3X6_1, platform3X6_2: platform3X6_2, platform6X6_1: platform6X6_1, platform6X6_2: platform6X6_2, screenWidth: screenWidth, screenHeight: screenHeight)
        platform3X6_2.physicsBody?.categoryBitMask = PhysicsCategory.Platform
        platform3X6_2.physicsBody?.collisionBitMask = PhysicsCategory.Player
         platform3X6_2.physicsBody?.contactTestBitMask = PhysicsCategory.Player

        addChild(platform3X6_2)
        

       // drawPlatform12x6_2(platform12X6_2: platform12X6_2, screenWidth: screenWidth, screenHeight: screenHeight)
        platform12X6_2.physicsBody?.categoryBitMask = PhysicsCategory.Platform
        platform12X6_2.physicsBody?.collisionBitMask = PhysicsCategory.Player
        platform12X6_2.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        
        //addChild(platform12X6_2)

        
        //Draw enemies here --->
        
        drawEnemyFarmer(farmer: enemyFarmer, screenWidth: screenWidth, screenHeight: screenHeight, platform6X6_2: platform6X6_2)
        addChild(enemyFarmer)
        //
        
        playerslifeLabel.text = "Lives: X"
        playerslifeLabel.fontColor = SKColor.black
        playerslifeLabel.fontSize = 100
        playerslifeLabel.zPosition = 150
        playerslifeLabel.position = CGPoint(x: 0 , y: cameraRect.height)
        addChild(playerslifeLabel)
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
       // print("contact")
        let collisionPlayerVSPlatform = contact.bodyA.categoryBitMask
            | contact.bodyB.categoryBitMask
        
        let collisionChickenVSPlatform = contact.bodyA.categoryBitMask
            | contact.bodyB.categoryBitMask
        
        //print("Hit")
        if collisionPlayerVSPlatform == PhysicsCategory.Player | PhysicsCategory.Platform{
            //print("platform")
            canJump = true
            //print("Jumped")
        }else{
            canJump = false
        }
        
        if collisionChickenVSPlatform == PhysicsCategory.Chicken | PhysicsCategory.Platform{
            
            chickenPlayer.physicsBody = nil;
            
            //print("chicken VS platform COLLISION")
            //print("Jumped")
        }else{
           //print("chicken VS platform ELSE")
        }
        
      
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        //print("Not hit")
    }
    
    
    //##################################
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {

        touch = true
        //print("it's clicking")

    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touch = false
        //print("it's not clicking anymore")
    }
    //##################################
    
    public var cameraRect : CGRect {
        let x = cameraNode.position.x - size.width/2
            + (size.width - playableRect.width)/2
        let y = cameraNode.position.y - size.height/2
            + (size.height - playableRect.height)/2
        return CGRect(
            x: x,
            y: y,
            width: playableRect.width,
            height: playableRect.height

        )
        
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
        playerslifeLabel.position = CGPoint(x:cameraNode.position.x, y: playerslifeLabel.position.y)

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

        if mainPlayer.position.x <= cameraNode.position.x - mainPlayer.size.width*4{
            mainPlayer.position.x = mainPlayer.position.x + 25
        }else{
             mainPlayer.position.x = mainPlayer.position.x + 10
        }

        //chickenPlayer.position.x = chickenPlayer.position.x + 10
        //mainPlayer.run(SKAction .rotate(byAngle: -π / 4.0, duration: 1))
    }
    
    
    func spawnChicken() {
       ChickenTexture()
       chickenPlayer.position = CGPoint(
            x: CGFloat.random(min: mainPlayer.position.x + 200,
                max: cameraRect.maxX),
            y: cameraRect.height/2)
   
        chickenPlayer.physicsBody?.categoryBitMask = PhysicsCategory.Chicken
        //chickenPlayer.physicsBody?.collisionBitMask = PhysicsCategory.Player
        chickenPlayer.physicsBody?.collisionBitMask = PhysicsCategory.Platform
        //chickenPlayer.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        chickenPlayer.physicsBody?.contactTestBitMask = PhysicsCategory.Platform
        
        addChild(chickenPlayer)
        let appear = SKAction.scale(to: 1.0, duration: 0.5)
        let wait = SKAction.wait(forDuration: 10.0)
        let disappear = SKAction.scale(to: 0, duration: 0.5)
        let removeFromParent = SKAction.removeFromParent()
        let actions = [appear, wait, disappear, removeFromParent]
        chickenPlayer.run(SKAction.sequence(actions))
       
    }
    
    func MainPlayerHit(cPlayer: SKSpriteNode){
        chickenPlayer.name = "ChickenTrain"
        chickenPlayer.removeAllActions()
        chickenPlayer.setScale(1.0)
        chickenPlayer.zRotation = 0
   
    }
    
    func chickenTrain(){
        var targetPosition = mainPlayer.position
            
        enumerateChildNodes(withName: "Chicken") { node, stop in
            if !node.hasActions() {
                let actionDuration = 0.3
                let offset = targetPosition -  node.position
                let direction = offset.normalized()
                let amountToMovePerSec = direction * self.chickenMovePerSec
                let amountToMove = amountToMovePerSec * CGFloat(actionDuration)
                let moveAction = SKAction.moveBy(x: amountToMove.x, y: amountToMove.y, duration: actionDuration)
                node.run(moveAction)
             
            }
            targetPosition = node.position
        }
        
    }
    
    func checkCollisions(){
        var hitChicken: [SKSpriteNode] = []
        enumerateChildNodes(withName: "Chicken"){
            node, _ in let chicken = node as! SKSpriteNode
            if chicken.frame.intersects(mainPlayer.frame){
                hitChicken.append(chicken)
                print("Hits MainPlayer")
            }
        }
        /*for Chicken in MainPlayerHit{
            MainPlayerHit(cPlayer: chickenPlayer)
        }*/
    }
    
    func ResetGameScene(){
        let gameScene:GameScene = GameScene(size: self.size)
        let transition = SKTransition.fade(withDuration: 1.0)
        gameScene.scaleMode = self.scaleMode
        self.view!.presentScene(gameScene, transition: transition)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        playerslifeLabel.text = "Lives: \(playerLife)"
        moveCamera()
        moveClouds(sun: sun, cloud_1: cloud_1, cloud_2: cloud_2, barn: barn, houseBG: houseBg, cameraNode: cameraNode, cameraMovePointsPerSec: cameraMovePointsPerSec, screenWidth: screenWidth, screenHeight: screenHeight)
       
        resetPlatformsHere(platform3X6_1: platform3X6_1, platform6X6_1: platform6X6_1, platform12X6_1: platform12X6_2, platform3X6_2: platform3X6_2, platform6X6_2: platform6X6_2, platform12X6_2: platform12X6_2, screenWidth: screenWidth, screenHeight: screenHeight, cameraNode: cameraNode, cameraRect: cameraRect, enemyFarmer: enemyFarmer)
       
        
        /*
        if(cameraNode.position.x > 4000)
        {
                 updateEnemy(farmer: enemyFarmer, screenWidth: screenWidth, screenHeight: screenHeight, platform6X6_1: platform6X6_1, platform6X6_2: platform6X6_2)
        }
        */

        
        AnimatePlayer()
    
        if touch && canJump {
             canJump = false
             mainPlayer.physicsBody!.applyImpulse(CGVector(dx: 0, dy: 2000))
        }
        
        if mainPlayer.position.y < playableRect.height/4{
            playerLife = 0;
            ResetGameScene()
        }
        //checkCollisions()
        //chickenTrain()
        //print("\(cameraNode.position.x) camera X here")
        
        
    }

}

