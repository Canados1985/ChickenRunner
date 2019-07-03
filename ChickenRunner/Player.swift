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

var ChickenAtlas = SKTextureAtlas()
var ChickenArray = [SKTexture]()
var chickenPlayer = SKSpriteNode()

 
       
func PlayerTexture(){
TextureAtlas = SKTextureAtlas(named: "Rooster")
        
    for i in 1...TextureAtlas.textureNames.count{
        let Name = "Rooster\(i).png"
        TextureArray.append(SKTexture(imageNamed: Name))
            
        }
    mainPlayer.name = "Main"
    mainPlayer = SKSpriteNode(imageNamed: TextureAtlas.textureNames[0])
    mainPlayer.size = CGSize(width: 220, height: 220)
    mainPlayer.position = CGPoint(x: 300 , y: 600)
    mainPlayer.zPosition = 100
    mainPlayer.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: mainPlayer.size.width, height: mainPlayer.size.height), center: CGPoint(x: 0, y: 0))
    mainPlayer.physicsBody?.affectedByGravity = true
    mainPlayer.physicsBody!.isDynamic = true
    mainPlayer.physicsBody?.allowsRotation = false
    mainPlayer.run(SKAction.repeatForever(SKAction.animate(with: TextureArray, timePerFrame: 0.1)))
        
    }

func ChickenTexture(){
    ChickenAtlas = SKTextureAtlas(named: "Hen")
 
    for i in 1...ChickenAtlas.textureNames.count{
        let Name = "Hen\(i).png"
        ChickenArray.append(SKTexture(imageNamed: Name))
 
    }
 
    chickenPlayer = SKSpriteNode(imageNamed: ChickenAtlas.textureNames[0])
    chickenPlayer.name = "Chicken"
    
    chickenPlayer.size = CGSize(width: 180, height: 200)
    chickenPlayer.zPosition = 100
    chickenPlayer.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: chickenPlayer.size.width, height: chickenPlayer.size.height), center: CGPoint(x: 0, y: 0))
    mainPlayer.physicsBody?.affectedByGravity = true
    chickenPlayer.physicsBody!.isDynamic = true
    chickenPlayer.physicsBody?.allowsRotation = false
    chickenPlayer.run(SKAction.repeatForever(SKAction.animate(with: ChickenArray, timePerFrame: 0.1)))
}




    
   
    

