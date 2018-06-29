//
//  Game.swift
//  Pong
//
//  Created by Matthew Jeng on 6/26/18.
//  Copyright © 2018 Matthew Jeng. All rights reserved.
//

import SpriteKit

protocol GameDelegate: class {
    func addGameObject(_ gameObject: SKNode)
    func removeGameObject(_ gameObject: SKNode)
}

class Game {
    
    enum GameMode {
        case normal
        case special
    }
    
    let walls: Set<Wall>
    let playerPaddle: SKShapeNode
    let aiPaddle: SKShapeNode
    let ai: Ai
    var pongs: Set<SKShapeNode> = Set<SKShapeNode>()
    
    let gameDelegate: GameDelegate
    let gameMode: GameMode
    
    init(gameDelegate: GameDelegate, gameMode: GameMode) {
        self.gameMode = gameMode
        self.gameDelegate = gameDelegate
        
        self.walls = GameUtils.makeDefaultWalls()
        
        self.playerPaddle = Paddle(type: .player)
        
        self.aiPaddle = Paddle(type: .ai)
        self.ai = Ai(with: aiPaddle, level: .hard)
        
    }
    
    func startGame() {
        for wall in walls {
            gameDelegate.addGameObject(wall)
        }
        gameDelegate.addGameObject(playerPaddle)
        gameDelegate.addGameObject(aiPaddle)
    }
    
    func produceBall() {
        let newBall = Pong()
        pongs.insert(newBall)
        gameDelegate.addGameObject(newBall)
    }
    
    func determinePaddlePos(basedOn fingerPosition: CGPoint) -> CGPoint {
        switch gameMode {
        case .normal: return CGPoint(x: -GameConstants.screenSize.width/2, y: fingerPosition.y)
        case .special: return fingerPosition
        }
    }
    
}
