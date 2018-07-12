
//
//  NibView.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/11.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

@IBDesignable
open class NibView: UIView {
    public private(set) var view: UIView!
    open var nibName: String {
        fatalError("Must override")
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        addSubview(view)
        backgroundColor = .clear
        view.backgroundColor = .clear
    }
    
    open func loadViewFromNib() -> UIView {
        let nib = UINib(nibName: nibName, bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}

