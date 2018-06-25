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
        case beginner
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
    
    
    func calculateNextPos(currBallSet: Set<SKShapeNode>) -> CGFloat {
        let direction = beginner(currBallSet: currBallSet)
        return determineMove(direction: direction) + aiPaddle.position.y
    }
    
    private func determineMove(direction: PaddleDirection) -> CGFloat {
        let beginnerDy: CGFloat = 1
        switch direction {
        case .up: return beginnerDy
        case .down: return -beginnerDy
        case .none: return 0
        }
    }
    
    private func beginner(currBallSet: Set<SKShapeNode>) -> PaddleDirection {
        if currBallSet.isEmpty {
            return .none
        }
        var closestBall: SKShapeNode = SKShapeNode()
        var closestDistance: CGFloat = CGFloat.infinity
        var currDistance: CGFloat
        for ball in currBallSet {
            currDistance = calculateDistance(p1: aiPaddle.position, p2: ball.position)
            if currDistance < closestDistance {
                closestDistance = currDistance
                closestBall = ball
            }
        }
        
        let diff: CGFloat = closestBall.position.y - aiPaddle.position.y
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
