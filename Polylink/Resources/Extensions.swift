//
//  Extensions.swift
//  Polylink
//
//  Created by Curse on 2/17/21.
//


import Foundation
import UIKit

//helper function that make it easier to size UI
extension UIView {
            //name   //return type
    public var width: CGFloat {
        return self.frame.size.width
    }

    public var height: CGFloat {
        return self.frame.size.height
    }

    public var top: CGFloat {
        return self.frame.origin.y
    }

    public var bottom: CGFloat {
        return self.frame.size.height + self.frame.origin.y
    }

    public var left: CGFloat {
        return self.frame.origin.x
    }

    public var right: CGFloat {
        return self.frame.size.width + self.frame.origin.x
    }

}
