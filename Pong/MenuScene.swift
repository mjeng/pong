//
//  MenuScene.swift
//  Pong
//
//  Created by Matthew Jeng on 6/27/18.
//  Copyright © 2018 Matthew Jeng. All rights reserved.
//

import SpriteKit

protocol MenuDelegate {
    func loadGameScene()
}
class MenuScene: SKScene {

    var playButton: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        
        let playButtonTex = SKTexture(imageNamed: "play-button")
        playButton = SKSpriteNode(texture: playButtonTex)
        playButton.position = CGPoint(x: frame.midX, y: frame.midY)
        self.addChild(playButton)
        
        let redBall = SKShapeNode(circleOfRadius: 10.0)
        redBall.fillColor = .red
        redBall.position = .zero
        redBall.physicsBody = SKPhysicsBody(circleOfRadius: 10.0)
        self.addChild(redBall)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let nodeTouched = self.atPoint(pos)
            
            if nodeTouched == playButton {
                let transition = SKTransition.fade(withDuration: 0.5)
                let scene = SKScene(fileNamed: "GameScene")
                self.view?.presentScene(scene!, transition: transition)
            }
        }
    }
    
}

