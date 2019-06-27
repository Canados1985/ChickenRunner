//
//  Player.swift
//  ChickenRunner
//
//  Created by Loi Saldana on 2019-06-21.
//  Copyright © 2019 Andrey Osokin. All rights reserved.
//

import Foundation
import SpriteKit


    var TextureAtlas = SKTextureAtlas()
    var TextureArray = [SKTexture]()
    var mainPlayer = SKSpriteNode()
 
       
    func PlayerTexture(){
        TextureAtlas = SKTextureAtlas(named: "Player")
        
        for i in 1...TextureAtlas.textureNames.count{
            let Name = "poring\(i).png"
            TextureArray.append(SKTexture(imageNamed: Name))
            
        }
        
        mainPlayer = SKSpriteNode(imageNamed: TextureAtlas.textureNames[0])
        mainPlayer.size = CGSize(width: 180, height: 150)
        mainPlayer.position = CGPoint(x: 300 , y: 600)
        mainPlayer.zPosition = 100
        mainPlayer.physicsBody = SKPhysicsBody(circleOfRadius: 90, center: CGPoint(x: 0, y: 0))
        mainPlayer.physicsBody?.affectedByGravity = true
        mainPlayer.physicsBody!.isDynamic = true
        mainPlayer.run(SKAction.repeatForever(SKAction.animate(with: TextureArray, timePerFrame: 0.1)))
        
    }
    
   
    

