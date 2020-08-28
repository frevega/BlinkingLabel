//
//  BlinkingLabel.swift
//  BlinkingLabel
//
//  Created by Freddy Miguel Vega Zárate on 27-08-20.
//

public class BlinkingLabel : UILabel {
    public func startBlinking() {
        UIView.animate(
            withDuration: 0.25,
            delay: 0.0,
            options: [.repeat, .autoreverse],
            animations: {
                self.alpha = 0
            }
        )
    }
 
    public func stopBlinking() {
        alpha = 1
        layer.removeAllAnimations()
    }
}
