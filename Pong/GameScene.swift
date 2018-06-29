//
//  GameScene.swift
//  Pong
//
//  Created by Matthew Jeng on 5/28/18.
//  Copyright © 2018 Matthew Jeng. All rights reserved.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene, GameDelegate {
    
    var game: Game!
    var fingerPosition: CGPoint = CGPoint(x: 0.0, y: -GameConstants.defaultPaddleHeight/2)
    
    override func didMove(to view: SKView) {
        
        GameConstants.screenSize = (self.view?.frame.size)!
        game = Game(gameDelegate: self, gameMode: .normal)
        game.startGame()
        
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
        game.update()
        game.setPaddlePos(basedOn: fingerPosition, type: .player)
        game.setPaddlePos(basedOn: fingerPosition, type: .ai)
    }
}

extension GameScene {
    
    func addGameObject(_ gameObject: SKNode) {
        self.addChild(gameObject)
    }
    
    func checkIfExistsInGame(_ gameObject: SKNode) -> Bool {
        return self.intersects(gameObject)
    }
    
    func removeGameObject(_ gameObject: SKNode) {
        gameObject.removeFromParent()
    }
    
    
}
