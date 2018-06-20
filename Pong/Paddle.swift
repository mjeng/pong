//
//  Paddle.swift
//  Pong
//
//  Created by Matthew Jeng on 5/29/18.
//  Copyright © 2018 Matthew Jeng. All rights reserved.
//


enum PaddleType {
    case player
    case ai
}

class Paddle {
    let distanceFromGoal = 10
    var paddleType: PaddleType
    var position: Point
    
    init(as paddleType: PaddleType, at position: Point) {
        self.paddleType = paddleType
        self.position = position
    }
    
    func updatePosition(to position: Point) {
        self.position = position
    }
}
