//
//  BreakerViewController.swift
//  Breaker
//
//  Created by Issa CAMARA on 19/05/15.
//  Copyright (c) 2015 Issa CAMARA. All rights reserved.
//

import UIKit

class BreakoutViewController: UIViewController {
    
    @IBOutlet weak var gameView: UIView!
    
    
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
    
    @IBOutlet weak var stopper: Stopper!
    
    @IBAction func moveStopper(sender: UIPanGestureRecognizer) {
        let location = sender.locationInView(gameView)
        if location.x >= CGFloat(widthOffset) && location.x <= (gameView.bounds.size.width - CGFloat(widthOffset) - stopper.frame.width) {
            let newPosition = CGPoint(x: location.x, y: stopper.frame.origin.y)
            stopper.frame = CGRect(origin: newPosition, size: stopper.frame.size)
        }
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillLayoutSubviews() {
        drawBricks()
    }

}


private extension UIColor {
    class var random: UIColor {
//        switch arc4random() % 5{
//        case 0: return UIColor.greenColor()
//        case 1: return UIColor.blueColor()
//        case 2: return UIColor.orangeColor()
//        case 3: return UIColor.redColor()
//        case 4: return UIColor.purpleColor()
//        default: return UIColor.grayColor()
//        }
        let r = CGFloat(arc4random() % 256) / CGFloat(255)
        let g = CGFloat(arc4random() % 256) / CGFloat(255)
        let b = CGFloat(arc4random() % 256) / CGFloat(255)
        let a = CGFloat(arc4random() % 256) / CGFloat(255)
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}

