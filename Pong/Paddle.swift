//
//  Paddle.swift
//  Pong
//
//  Created by Matthew Jeng on 5/29/18.
//  Copyright © 2018 Matthew Jeng. All rights reserved.
//

import SpriteKit

enum PaddleType {
    case player
    case ai
}

class Paddle: SKShapeNode {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let distanceFromGoal = 10
    let height: CGFloat = 100
    let width: CGFloat = 10
    var cornerHW: CGFloat {
        return width/2
    }
    var paddleType: PaddleType

    init(position: CGPoint, paddleType: PaddleType) {
        self.paddleType = paddleType
        super.init()
        
        let rect = CGRect(origin: position, size: CGSize(width: width, height: height))
        self.path = CGPath(roundedRect: rect, cornerWidth: cornerHW, cornerHeight: cornerHW, transform: nil)
        
        self.fillColor = .black
        self.physicsBody = SKPhysicsBody(rectangleOf: rect.size)
    }
    
    
    
}
