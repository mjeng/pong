//
//  Wall.swift
//  Pong
//
//  Created by Matthew Jeng on 6/19/18.
//  Copyright © 2018 Matthew Jeng. All rights reserved.
//

import SpriteKit

class Wall: SKShapeNode {
    
    init(rect: CGRect) {
        super.init()
        
        self.path = CGPath(rect: rect, transform: nil)
        
        self.fillColor = .black
        self.physicsBody = SKPhysicsBody(circleOfRadius: radius)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.linearDamping = 0.0
        self.physicsBody?.velocity = initialVelocity
    }
    
}
