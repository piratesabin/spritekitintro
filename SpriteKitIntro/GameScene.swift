//
//  GameScene.swift
//  SpriteKitIntro
//
//  Created by LDC on 12/7/15.
//  Copyright (c) 2015 LDC. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var myLabel:SKLabelNode!
    var Cannon:SKSpriteNode!
    var touchLocation:CGPoint = CGPointZero
//    var ball:SKSpriteNode!
    var cannonFull: SKSpriteNode!
    
    
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        cannonFull = self.childNodeWithName("Cannon_Full") as! SKSpriteNode
        Cannon = cannonFull.childNodeWithName("Cannon") as! SKSpriteNode
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        touchLocation = touches.first!.locationInNode(self)
        
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let ball = SKScene(fileNamed: "Ball")!.childNodeWithName("ball")! as! SKSpriteNode
print("Touches ended")
        ball.removeFromParent()
        self.addChild(ball)
        ball.zPosition = 0
        ball.position = Cannon.position
        let angleInRadians = Float(Cannon.zRotation)
        let speed = CGFloat(75.0)
        let vx:CGFloat = CGFloat(cosf(angleInRadians)) * speed
        let vy:CGFloat = CGFloat(sinf(angleInRadians)) * speed
        ball.physicsBody?.applyImpulse(CGVectorMake(vx, vy))
//        ball.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 100))

        
        
    }
    
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        touchLocation = touches.first!.locationInNode(self)
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        let percent = touchLocation.x / size.width
        let newAngle = percent * 180 - 180
        Cannon.zRotation = CGFloat(newAngle) * CGFloat(M_PI) / 180.0
    }
}
