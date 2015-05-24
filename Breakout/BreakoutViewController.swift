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
    
    let bricksPerRow = 50
    let rowsPerGame = 10
    let offset = 100
    
    var brickSize: CGSize{
        let size = (gameView.bounds.size.width - 2 * CGFloat(offset)) / CGFloat(bricksPerRow)
        return CGSize(width: size, height: size)
    }

    
    func drawBricks(){
        
        for i in 0...rowsPerGame {
            var frame = CGRect(origin: CGPointZero, size: brickSize)
            frame.origin.y = CGFloat(i) * brickSize.width
            for j in 0...bricksPerRow {
                
                frame.origin.x = CGFloat(j) * brickSize.width + CGFloat(offset)
                
                let brickView = Brick(frame: frame, coordinate: CGPoint(x: i, y: j))
                brickView.backgroundColor = UIColor.random
                
                gameView.addSubview(brickView)
                
            }
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

