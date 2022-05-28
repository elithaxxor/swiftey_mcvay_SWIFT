//
//  imageDropperView.swift
//  imageDropper
//
//  Created by a-robota on 5/24/22.
//

import Foundation
import UIKit

class imageDropperView : UIView {

    var backgroundImage: UIImage? { didSet  { setNeedsDisplay() } }
        override func draw(_ rect : CGRect ) {
            backgroundImage?.draw(in: bounds)
        }
    }

