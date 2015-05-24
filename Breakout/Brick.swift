//
//  Brick.swift
//  Breaker
//
//  Created by Issa CAMARA on 19/05/15.
//  Copyright (c) 2015 Issa CAMARA. All rights reserved.
//

import UIKit

class Brick: UIView {
   
    let coordinate : CGPoint
    
    init(frame: CGRect, coordinate: CGPoint) {
        self.coordinate = coordinate
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
