//
//  BreakerViewController.swift
//  Breaker
//
//  Created by Issa CAMARA on 19/05/15.
//  Copyright (c) 2015 Issa CAMARA. All rights reserved.
//

import UIKit

class BreakoutViewController: UIViewController, UIDynamicAnimatorDelegate {
    
    @IBOutlet weak var gameView: UIView!
    @IBOutlet weak var ball: Ball!
    var ballBehavior = BallDynamicBehavior()
    
    lazy var animator: UIDynamicAnimator = {
        let lazilyCreatedDynanamicAnimator = UIDynamicAnimator(referenceView: self.gameView)
        lazilyCreatedDynanamicAnimator.delegate = self
        return lazilyCreatedDynanamicAnimator
    }()
    
    let bricksPerRow = 25
    let rowsPerGame = 5
    let topOffset = 70
    let widthOffset = 10
    
    var brickSize: CGSize{
        let size = (gameView.bounds.size.width - 2 * CGFloat(widthOffset)) / CGFloat(bricksPerRow)
        return CGSize(width: size, height: size / 2)
    }

    
    func drawBricks(){
        
        for i in 0...rowsPerGame - 1 {
            var frame = CGRect(origin: CGPointZero, size: brickSize)
            frame.origin.y = CGFloat(i) * brickSize.height + CGFloat(topOffset)
            for j in 0...bricksPerRow - 1 {
                
                frame.origin.x = CGFloat(j) * brickSize.width + CGFloat(widthOffset)
                
                let brickView = Brick(frame: frame, coordinate: CGPoint(x: i, y: j))
                brickView.backgroundColor = UIColor.random
                
                gameView.addSubview(brickView)
                
            }
        }
        
    }
    
    @IBOutlet weak var paddle: Paddle!
    
    @IBAction func movePaddle(sender: UIPanGestureRecognizer) {
        let location = sender.locationInView(gameView)
        if location.x >= CGFloat(widthOffset) && location.x <= (gameView.bounds.size.width - CGFloat(widthOffset) - paddle.frame.width) {
            let newPosition = CGPoint(x: location.x, y: paddle.frame.origin.y)
            paddle.frame = CGRect(origin: newPosition, size: paddle.frame.size)
        }
    }

    @IBAction func launchBall(sender: UITapGestureRecognizer) {
        ballBehavior.add(ball)
    }


    func positionComponents() {
        paddle.frame = CGRect(x: 275, y: 475, width: 50, height: 25)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        animator.addBehavior(ballBehavior)
    }
    
    override func viewWillLayoutSubviews() {
        drawBricks()
        
    }

}


private extension UIColor {
    class var random: UIColor {
        let r = CGFloat(arc4random() % 256) / CGFloat(255)
        let g = CGFloat(arc4random() % 256) / CGFloat(255)
        let b = CGFloat(arc4random() % 256) / CGFloat(255)
        let a = CGFloat(arc4random() % 256) / CGFloat(255)
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}

