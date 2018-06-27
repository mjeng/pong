//
//  Pong.swift
//  Pong
//
//  Created by Matthew Jeng on 6/26/18.
//  Copyright © 2018 Matthew Jeng. All rights reserved.
//

import SpriteKit

class Pong: SKShapeNode {
    
    init(radius: CGFloat = GameConstants.defaultPongRadius, startingPosition: CGPoint = GameConstants.origin, color: UIColor = .red, mass: CGFloat = GameConstants.defaultPongMass) {
        
        super.init()
        
        let pongOrigin = CGPoint(x: -radius, y: -radius)
        let stupidRect = CGRect(origin: pongOrigin, size: CGSize(width: 2*radius, height: 2*radius))
        self.path = CGPath(ellipseIn: stupidRect, transform: nil)
        
        self.position = startingPosition
        self.fillColor = color
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: radius)
        self.physicsBody?.mass = mass
        
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.linearDamping = 0.0
        self.physicsBody?.velocity = Pong.getRandomVelocity()
        
    }
    
    private static func getRandomVelocity() -> CGVector {
        
        var xVel: CGFloat = CGFloat(arc4random_uniform(UInt32(GameConstants.pongXMax-GameConstants.pongXMin)) + UInt32(GameConstants.pongXMin))
        var yVel: CGFloat = CGFloat(arc4random_uniform(UInt32(GameConstants.pongYMax-GameConstants.pongYMin)) + UInt32(GameConstants.pongYMin))

        let xFlip = Float(arc4random()) / Float(UINT32_MAX); print(xFlip)
        let yFlip = Float(arc4random()) / Float(UINT32_MAX); print(yFlip)
        

        if xFlip > 0.5 {
            xVel *= -1
        }
        if yFlip > 0.5 {
            yVel *= -1
        }

        let velocity = CGVector(dx: xVel, dy: yVel)

        return velocity
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
