//
//  Ball.swift
//  Pong
//
//  Created by Matthew Jeng on 5/29/18.
//  Copyright © 2018 Matthew Jeng. All rights reserved.
//

import SpriteKit

class PongBall: SKShapeNode {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let radius: CGFloat = 5
//    var velocity: CGVector
//
//    override init() {
//        super.init()
//    }

    init(position: CGPoint, initialVelocity: CGVector) {
        super.init()
        
        let diameter = radius * 2
        let rect = CGRect(origin: position, size: CGSize(width: diameter, height: diameter))
        self.path = CGPath(ellipseIn: rect, transform: nil)
        
        self.fillColor = .black
        self.physicsBody = SKPhysicsBody(circleOfRadius: radius)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.linearDamping = 0.0
        self.physicsBody?.velocity = initialVelocity
    }
    
}
