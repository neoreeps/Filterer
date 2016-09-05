//
//  PhotoView.swift
//  Filterer
//
//  Created by Kenny Speer on 9/4/16.
//  Copyright © 2016 Kenny Speer. All rights reserved.
//

import UIKit

class PhotoView: UIImageView {
    var lastTouchTime: NSDate? = nil
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    // when touch goes down
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    // when touch moves or vertical due to pressure changes
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if let touch = touches.first {
            let location = touch.location(in: self)
            print("x:\(location.x) y:\(location.y)")
        }
    }

    // lift finger or stop touches
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        let currentTime = NSDate()
        // swift nil usage, don't be fooled, this assignment will fail if lastTouchTime is nil since previous time is not optional and cannot be nil
        if let previousTime = lastTouchTime {
            if currentTime.timeIntervalSince(previousTime as Date) < 0.5 {
                print("Double Tap!")
                lastTouchTime = nil
            }
            else {
                lastTouchTime = currentTime
            }
        } else {
            lastTouchTime = currentTime
        }
    }
    
    // may be called due to other override, for instance pan view
    // special case and may not get triggered
    /*
     override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
    }
     */
}
