//
//  GameScene.swift
//  Pong
//
//  Created by Matthew Jeng on 5/28/18.
//  Copyright © 2018 Matthew Jeng. All rights reserved.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene {
    
    var fingerPosition: CGPoint = CGPoint(x: 0.0, y: -GameUtils.paddleHeight/2)
    var playerPaddle: SKShapeNode!
    var aiPaddle: SKShapeNode!
    let scaledSpeed = CGFloat(0.1)

    
    override func didMove(to view: SKView) {
        physicsWorld.speed = scaledSpeed

        
        let screenSize = (self.view?.frame.size)!
        
        let walls = GameUtils.makeWalls(screenSize)
        
        for wall in walls {
            self.addChild(wall)
        }
        
        self.playerPaddle = GameUtils.makePaddle(screenSize, .player)
        self.addChild(playerPaddle)
        
        self.aiPaddle = GameUtils.makePaddle(screenSize, .ai)
        self.addChild(aiPaddle)
        

    }
    
    
    func produceBall() {
        let newBall =  GameUtils.makePongBall()
        self.addChild(newBall)
        var velocity = GameUtils.getRandomImpulse()
        velocity.dx /= scaledSpeed
        velocity.dy /= scaledSpeed
        newBall.physicsBody?.velocity = velocity
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    func touchDown(atPoint pos: CGPoint) {
        fingerPosition = pos
        produceBall()
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    func touchMoved(toPoint pos : CGPoint) {
        fingerPosition = pos
    }


    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        for child in self.children {
            if !intersects(child) {
                child.removeFromParent()
            }
        }
        playerPaddle.position.y = fingerPosition.y
    }
}

//extension GameScene: SKPhysicsContactDelegate {
//
//}
