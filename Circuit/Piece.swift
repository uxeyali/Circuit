//
//  Piece.swift
//  Circuit
//
//  Created by Ghazanfar, Uzma on 10/31/17.
//  Copyright © 2017 Ghazanfar, Uzma. All rights reserved.
//

import UIKit

class Piece: UIImageView {
    
    public var name: String = ""
    public var rotation: Int = 0
    public var wires: [Bool] = [false, false, false, false, false, false]
    public var powered: Bool = false
    public var neighbors: [Int: Piece?] = [0: nil, 1: nil, 2: nil, 3: nil, 4: nil, 5: nil]
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
