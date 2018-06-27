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
    var ai: Ai!
    let scaledSpeed = CGFloat(1)
    var pongs: Set<SKShapeNode> = Set<SKShapeNode>()

    
    override func didMove(to view: SKView) {
        
        GameConstants.screenSize = (self.view?.frame.size)!
        
        physicsWorld.speed = scaledSpeed
        
        let walls = makeDefaultWalls()
        for wall in walls {
            self.addChild(wall)
        }
        
        self.playerPaddle = Paddle(type: .player)
        self.addChild(playerPaddle)
        
        self.aiPaddle = Paddle(type: .ai)
        self.ai = Ai(with: aiPaddle, level: .easy)
        self.addChild(aiPaddle)
        
    }
    
    func makeDefaultWalls() -> Set<Wall> {
        
        let screenSize: CGSize = GameConstants.screenSize
        let halfHeight = screenSize.height / 2
        let wallHeight = GameConstants.borderWallHeight
        
        let topWallPos = CGPoint(x: 0.0, y: halfHeight - wallHeight/2)
        let topWall = Wall(position: topWallPos, wallWidth: screenSize.width, wallHeight: wallHeight, color: GameConstants.defaultWallColor, strokeColor: GameConstants.defaultWallStrokeColor)
        
        let botWallPos = CGPoint(x: 0.0, y: -(halfHeight - wallHeight/2))
        let botWall = Wall(position: botWallPos, wallWidth: screenSize.width, wallHeight: wallHeight, color: GameConstants.defaultWallColor, strokeColor: GameConstants.defaultWallStrokeColor)
        
        let wallSet: Set = [topWall, botWall]
        
        return wallSet
        
    }
    
    func produceBall() {
        let newBall = Pong()
        pongs.insert(newBall)
        self.addChild(newBall)
//        var velocity = GameUtils.getRandomVelocity()
//        velocity.dx /= scaledSpeed
//        velocity.dy /= scaledSpeed
//        newBall.physicsBody?.velocity = velocity
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    func touchDown(atPoint pos: CGPoint) {
        fingerPosition = pos
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
                pongs.remove(child as! SKShapeNode)
            }
        }
        if pongs.count < 1 {
            produceBall()
        }
        playerPaddle.position.y = fingerPosition.y - playerPaddle.frame.height/2
        aiPaddle.position.y = ai.calculateNextPos(currBallSet: pongs)
    }
}


