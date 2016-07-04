//
//  MainMenu.swift
//  SpriteKitIntro
//
//  Created by Sabin Looker on 7/3/16.
//  Copyright © 2016 LDC. All rights reserved.
//

import SpriteKit

class MainMenu: SKScene {
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let game:GameScene = GameScene(fileNamed: "GameScene")!
        game.scaleMode = .AspectFill
        let transition:SKTransition = SKTransition.flipHorizontalWithDuration(1.0)
        self.view?.presentScene(game, transition: transition)
    }

}
