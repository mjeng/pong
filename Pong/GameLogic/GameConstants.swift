//
//  GameConstants.swift
//  Pong
//
//  Created by Matthew Jeng on 6/26/18.
//  Copyright © 2018 Matthew Jeng. All rights reserved.
//

import SpriteKit

class GameConstants {
    
    static var screenSize: CGSize!
    
    static let origin = CGPoint(x: 0.0, y: 0.0)
    
    static let defaultPongRadius = CGFloat(10.0)
    static let defaultPongMass = CGFloat(1.0)
    static let pongXMin = CGFloat(200.0)
    static let pongXMax = CGFloat(350.0)
    static let pongYMin = CGFloat(000.0)
    static let pongYMax = CGFloat(600.0)
    
    static let normalPongCount = 5
    static let specialPongCount = 20
    
    static let paddleWidth = CGFloat(8.0)
    static let defaultPaddleHeight = CGFloat(80.0)
    
    static let borderWallHeight = CGFloat(10.0)
    static let defaultWallColor = UIColor.black
    static let defaultWallStrokeColor = UIColor.black
    
}
