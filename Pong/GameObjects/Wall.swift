//
//  Wall.swift
//  Pong
//
//  Created by Matthew Jeng on 6/26/18.
//  Copyright © 2018 Matthew Jeng. All rights reserved.
//

import SpriteKit

class Wall: SKShapeNode {

    init(position: CGPoint, wallWidth: CGFloat, wallHeight: CGFloat, color: UIColor, strokeColor: UIColor) {
        
        super.init()

        let rect = CGRect(origin: .zero, size: CGSize(width: wallWidth, height: wallHeight))
        let pathExtractor = SKShapeNode(rect: rect)
        self.path = pathExtractor.path
        
        let adjustedPosition = CGPoint(x: position.x - wallWidth/2, y: position.y - wallHeight/2)
        self.position = adjustedPosition
        
        self.fillColor = color
        self.strokeColor = strokeColor
        
        let centerFromWallPosition = CGPoint(x: wallWidth/2, y: wallHeight/2)
        self.physicsBody = SKPhysicsBody(rectangleOf: rect.size, center: centerFromWallPosition)
        self.physicsBody?.isDynamic = false
        self.physicsBody?.restitution = 1.0
        self.physicsBody?.friction = 0.0

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
