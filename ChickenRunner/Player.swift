//
//  Player.swift
//  ChickenRunner
//
//  Created by Loi Saldana on 2019-06-21.
//  Copyright © 2019 Andrey Osokin. All rights reserved.
//

import Foundation
import SpriteKit


class Player : SKSpriteNode {

    //var playerAnimation: [SKAction] = []
    //let player = SKSpriteNode(imageNamed: "poring1")
    var TextureAtlas = SKTextureAtlas()
    var TextureArray = [SKTexture]()
    
    var mainPlayer = SKSpriteNode()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Use init()")
    }
    init() {
        let texture = SKTexture(imageNamed: "poring1")
       
        super.init(texture: texture, color: .white,
                   size: texture.size())
        name = "Player"
        position = CGPoint(x: 120, y: 120)
        zPosition = 50
        setScale(5)
        
        TextureAtlas = SKTextureAtlas(named: "Player")
        
        for i in 0...TextureAtlas.textureNames.count{
            let Name = "poring\(i).png"
            TextureArray.append(SKTexture(imageNamed: Name))
            
            
            
        }
        
    
        mainPlayer = SKSpriteNode(imageNamed: TextureAtlas.textureNames[0] )
        mainPlayer.size = CGSize(width: 70, height: 140)
        mainPlayer.position = CGPoint(x: 300 , y: 300)
    }
    
  
    
   
    
}
