//
//  Ai.swift
//  Pong
//
//  Created by Matthew Jeng on 6/24/18.
//  Copyright © 2018 Matthew Jeng. All rights reserved.
//

import SpriteKit

class Ai {
    
    enum AiLevel {
        case easy
        case medium
        case hard
        case impossible
    }
    enum PaddleDirection {
        case up
        case down
        case none
    }
    
    let level: AiLevel
    var aiPaddle: SKShapeNode
    
    init(with aiPaddle: SKShapeNode, level: AiLevel) {
        self.aiPaddle = aiPaddle
        self.level = level
    }
    
    
    func calculateNextPos(currBallSet: Set<SKShapeNode>) -> CGPoint {
        let direction = findAiDirection(currBallSet: currBallSet)
        return CGPoint(x: aiPaddle.position.x, y: determineMove(direction: direction) + aiPaddle.position.y)
    }
    
    private func determineMove(direction: PaddleDirection) -> CGFloat {
        var dy: CGFloat
        switch level {
        case .easy: dy = 1.0
        case .medium: dy = 2.0
        case .hard: dy = 3.0
        case .impossible: dy = 4.0
        }
        
        switch direction {
        case .up: return dy
        case .down: return -dy
        case .none: return 0
        }
    }
    
    private func findAiDirection(currBallSet: Set<SKShapeNode>) -> PaddleDirection {
        if currBallSet.isEmpty {
            return .none
        }
        
        let aiTrueOrigin = CGPoint(x: aiPaddle.position.x, y: aiPaddle.position.y + aiPaddle.frame.height/2)
        
        var closestBall: SKShapeNode = SKShapeNode()
        var closestDistance: CGFloat = CGFloat.infinity
        var currDistance: CGFloat
        for ball in currBallSet {
            currDistance = calculateDistance(p1: aiTrueOrigin, p2: ball.position)
            if currDistance < closestDistance {
                closestDistance = currDistance
                closestBall = ball
            }
        }
        
        let diff: CGFloat = closestBall.position.y - aiTrueOrigin.y
        switch diff {
        case CGFloat(0).nextUp..<CGFloat.infinity: return .up
        case -CGFloat.infinity..<0: return .down
        default: return .none
        }
        
    }

    private func calculateDistance(p1: CGPoint, p2: CGPoint) -> CGFloat {
        let dx = p1.x - p2.x
        let dy = p1.y - p2.y
        return pow(pow(dx, 2) + pow(dy, 2), 0.5)
    }
    
}
