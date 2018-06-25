//
//  GameUtils.swift
//  Pong
//
//  Created by Matthew Jeng on 6/24/18.
//  Copyright © 2018 Matthew Jeng. All rights reserved.
//

import SpriteKit

class GameUtils {
    
    static private let pongRadius = CGFloat(10.0)
    
    static private let pongXMin = CGFloat(300.0)
    static private let pongXMax = CGFloat(450.0)
    static private let pongYMax = CGFloat(800.0)
    
    static private let paddleWidth = CGFloat(10.0)
    static let paddleHeight = CGFloat(150.0)
    static private let paddleSize = CGSize(width: paddleWidth, height: paddleHeight)
    
    static private let wallHeight = CGFloat(15.0)
    
    static func makeWalls(_ screenSize: CGSize) -> Set<SKShapeNode> {
        let halfWidth = screenSize.width / 2
        let halfHeight = screenSize.height / 2

        let wallSize = CGSize(width: screenSize.width, height: wallHeight)
        let topWallPos = CGPoint(x: -halfWidth, y: halfHeight-wallHeight)
        let topWallRect = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: wallSize)
        let topWall = SKShapeNode(rect: topWallRect)
        topWall.position = topWallPos
        
        let botWallPos = CGPoint(x: -halfWidth, y: -halfHeight)
        let botWallRect = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: wallSize)
        let botWall = SKShapeNode(rect: botWallRect)
        botWall.position = botWallPos
        
        let wallSet: Set = [topWall, botWall]
        
        var origin: CGPoint
        for wall in wallSet {
            wall.fillColor = .black
            wall.strokeColor = .black
            
            origin = CGPoint(x: (wall.position.x + halfWidth*2), y: wall.position.y + halfHeight + wallHeight/2)
            origin = CGPoint(x: halfWidth, y: wallHeight/2)
            wall.physicsBody = SKPhysicsBody(rectangleOf: wallSize, center: origin)
            print(origin)
            print(screenSize.height)
            wall.physicsBody?.isDynamic = false
            wall.physicsBody?.restitution = 1.0
            wall.physicsBody?.friction = 0.0
//            wall.physicsBody?.collisionBitMask = 0b1
        }
        
        return wallSet
    }

    enum PlayerType {
        case player
        case ai
    }
    static func makePaddle(_ screenSize: CGSize, _ type: PlayerType) -> SKShapeNode {
        
        let halfWidth = screenSize.width / 2
        let halfHeight = screenSize.height / 2
        
        var paddlePos: CGPoint
        switch type {
        case .player:
            paddlePos = CGPoint(x: -halfWidth, y: -paddleHeight/2)
        case .ai:
            paddlePos = CGPoint(x: halfWidth-paddleWidth, y: -paddleHeight/2)
        }
        
        let paddleRect = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: paddleSize)
        let paddle = SKShapeNode(rect: paddleRect, cornerRadius: paddleWidth/2)
        paddle.position = paddlePos
        paddle.physicsBody = SKPhysicsBody(rectangleOf: paddleSize, center: CGPoint(x: paddleWidth/2, y: paddleHeight/2))
        paddle.physicsBody?.isDynamic = false
        paddle.physicsBody?.restitution = 1.0
        paddle.physicsBody?.friction = 0.0
        
        return paddle
    }

    static func makePongBall() -> SKShapeNode {
        let pongBall = SKShapeNode(circleOfRadius: pongRadius)
        pongBall.position = CGPoint(x: 0.0, y: 0.0)
        pongBall.fillColor = .red
        pongBall.physicsBody = SKPhysicsBody(circleOfRadius: pongRadius)
        pongBall.physicsBody?.mass = CGFloat(1.0)
        pongBall.physicsBody?.affectedByGravity = false
        pongBall.physicsBody?.linearDamping = 0.0
//        pongBall.physicsBody?.collisionBitMask = 0b1
        return pongBall
    }
    
    static func getRandomImpulse() -> CGVector {
        var xVelocity: CGFloat = CGFloat(arc4random_uniform(UInt32(pongXMax-pongXMin)) + UInt32(pongXMin))
        var yVelocity: CGFloat = CGFloat(arc4random_uniform(UInt32(pongYMax)))
        
        let xFlip = arc4random_uniform(2)
        let yFlip = arc4random_uniform(2)
        print(xFlip)
        print(yFlip)
        
        if xFlip == 1 {
            xVelocity *= -1
        }
        if yFlip == 1 {
            yVelocity *= -1
        }
        
        let impulse = CGVector(dx: xVelocity, dy: yVelocity)
        print(impulse)
        return impulse
    }
    
}

