//
//  GameScene.swift
//  Pong
//
//  Created by Matthew Jeng on 5/28/18.
//  Copyright © 2018 Matthew Jeng. All rights reserved.
//

import SpriteKit
import GameplayKit

struct PhysicsCategory {
    static let none = 0b0
    static let all = ~0b0
    static let pongBall = 0b1 << 0
    static let paddle = 0b1 << 1
    static let wall = 0b1 << 2
    static let sun = 0b1 << 3
}

struct ExampleCategory {
    
}

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .lightGray
//        physicsWorld.gravity = CGVector(dx: 0.0, dy: -9.8)
        physicsWorld.contactDelegate = self
        
//        let ballRadius: CGFloat = 20
//        let redBall = SKShapeNode(circleOfRadius: ballRadius)
//        redBall.fillColor = .red
//        redBall.position = CGPoint(x: 100, y: 200)
//        redBall.physicsBody = SKPhysicsBody(circleOfRadius: ballRadius)
//
//        self.addChild(redBall)
//
//        let blueBall = SKShapeNode(circleOfRadius: ballRadius)
//        blueBall.fillColor = .blue
//        blueBall.position = CGPoint(x: -100, y: 200)
//        blueBall.physicsBody = SKPhysicsBody(circleOfRadius: ballRadius)
//        blueBall.physicsBody?.restitution = 0.9
//        blueBall.physicsBody?.linearDamping = 0.1
//
//
//        self.addChild(blueBall)
//
//        var points = [CGPoint(x: -200, y: -100),
//                      CGPoint(x: 200, y: -100)]
//        let newGround = SKShapeNode(points: &points, count: points.count)
//        newGround.physicsBody = SKPhysicsBody(edgeChainFrom: newGround.path!)
//        newGround.physicsBody?.restitution = 1.0
//
//        self.addChild(newGround)
//
//        let greenBall = SKShapeNode(circleOfRadius: ballRadius)
//        greenBall.fillColor = .green
//        greenBall.position = CGPoint(x: 200, y: 150)
//        greenBall.physicsBody = SKPhysicsBody(circleOfRadius: 1)
//        greenBall.physicsBody?.affectedByGravity = false
//
//        self.addChild(greenBall)

        self.addChild(PongBall(position: CGPoint(x: -80, y: 50), initialVelocity: CGVector(dx: 1, dy: -3.0)))
        self.addChild(Wall(rect: <#T##CGRect#>))
    }
    
    
//    func touchDown(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.green
//            self.addChild(n)
//        }
//    }
//
//    func touchMoved(toPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.blue
//            self.addChild(n)
//        }
//    }
//
//    func touchUp(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.red
//            self.addChild(n)
//        }
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let label = self.label {
//            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
//        }
//
//        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print(touches)
//
//        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//    }
//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//    }
//
    
//    override func update(_ currentTime: TimeInterval) {
//        // Called before each frame is rendered
//    }
}

extension GameScene: SKPhysicsContactDelegate {
    
}
