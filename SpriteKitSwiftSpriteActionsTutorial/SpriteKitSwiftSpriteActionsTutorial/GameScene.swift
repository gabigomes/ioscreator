//
//  GameScene.swift
//  SpriteKitSwiftSpriteActionsTutorial
//
//  Created by Arthur Knopper on 21-07-14.
//  Copyright (c) 2014 Arthur Knopper. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let cup = SKSpriteNode(imageNamed: "coffeecup.png")
		cup.position = CGPointMake(self.size.width/2, self.size.height/2)
		
		self.addChild(cup)

		/*let moveBottomLeft = SKAction.moveTo(CGPointMake(400, 100), duration: 2.0)
		cup.runAction(moveBottomLeft)*/
		
		let moveRight = SKAction.moveByX(50, y: 0, duration: 1.0)
		//cup.runAction(moveRight)
		
		let moveBottom = SKAction.moveByX(0, y:-100, duration:3.0)
		//let sequence = SKAction.sequence([moveRight, moveBottom]);
		
		let reversedMoveBottom = moveBottom.reversedAction()
		let sequence = SKAction.sequence([moveRight, moveBottom, reversedMoveBottom])
		
		//cup.runAction(sequence);
		
		let endlessAction = SKAction.repeatActionForever(sequence)
		cup.runAction(endlessAction)
	}
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
