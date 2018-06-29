//
//  Paddle.swift
//  Pong
//
//  Created by Matthew Jeng on 6/26/18.
//  Copyright © 2018 Matthew Jeng. All rights reserved.
//

import SpriteKit

class Paddle: SKShapeNode {
    
    enum PlayerType {
        case player
        case ai
    }
    
    init(type: PlayerType, paddleWidth: CGFloat = GameConstants.paddleWidth, paddleHeight: CGFloat = GameConstants.defaultPaddleHeight) {
        
        super.init()
        
        let halfWidth = GameConstants.screenSize.width/2
        
        var paddlePos: CGPoint
        switch type {
        case .player:
            paddlePos = CGPoint(x: -halfWidth, y: -paddleHeight/2)
        case .ai:
            paddlePos = CGPoint(x: halfWidth-paddleWidth, y: -paddleHeight/2)
        }
        self.position = paddlePos
        
        let paddleSize = CGSize(width: paddleWidth, height: paddleHeight)
        let paddleRect = CGRect(origin: .zero, size: paddleSize)
        let pathExtractor = SKShapeNode(rect: paddleRect, cornerRadius: paddleWidth/2)
        self.path = pathExtractor.path
        
        self.physicsBody = SKPhysicsBody(rectangleOf: paddleSize, center: CGPoint(x: paddleWidth/2, y: paddleHeight/2))
        self.physicsBody?.isDynamic = false
        self.physicsBody?.restitution = 1.0
        self.physicsBody?.friction = 0.0
        
    }

    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
