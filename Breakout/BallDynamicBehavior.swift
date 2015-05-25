//
//  BallDynamicBehavior.swift
//  Breakout
//
//  Created by Issa CAMARA on 25/05/15.
//  Copyright (c) 2015 Issa CAMARA. All rights reserved.
//

import UIKit

class BallDynamicBehavior: UIDynamicBehavior {
    
    lazy var collider: UICollisionBehavior = {
        let lazilyCreatedCollider = UICollisionBehavior()
        lazilyCreatedCollider.translatesReferenceBoundsIntoBoundary = true
        return lazilyCreatedCollider
    }()
    
    
    lazy var dropBehavior: UIDynamicItemBehavior = {
        let lazilyCreatedDropBehavior = UIDynamicItemBehavior()
        lazilyCreatedDropBehavior.allowsRotation = true
        lazilyCreatedDropBehavior.elasticity = 0.75
        return lazilyCreatedDropBehavior
    }()
    
    let gravity = UIGravityBehavior()
    
    override init(){
        super.init()
        addChildBehavior(collider)
        addChildBehavior(dropBehavior)
        addChildBehavior(gravity)
    }
    
    func add(ball: Ball){
        collider.addItem(ball)
        dropBehavior.addItem(ball)
        gravity.addItem(ball)
    }
   
}
