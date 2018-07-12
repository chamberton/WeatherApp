//
//  TemperatureInfoLabel.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/11.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

@IBDesignable
class TemperatureInfoLabel: NibView {
    @IBOutlet private weak var loadingView: UIView!
    @IBOutlet private weak var loadingIndicatorView: UIActivityIndicatorView!
    @IBOutlet private weak var temperatureValueLabel: UILabel!
    @IBOutlet private weak var temperatureDescriptionLabel: UILabel!
    
    private var status: DataStatus = .loading {
        willSet {
            switch newValue {
            case .loading:
                toggleLoadingView(isHidden: false)
            case .missing:
                toggleLoadingView(isHidden: true)
                temperatureValueLabel.textColor = .red
                temperatureDescriptionLabel.textColor = .red
                temperatureValueLabel.text = "--"
                temperatureDescriptionLabel.text = "--"
            case .available(let value,let description):
                toggleLoadingView(isHidden: true)
                temperatureValueLabel.textColor = .white
                temperatureDescriptionLabel.textColor = .white
                temperatureValueLabel.text = "\(String(Int(value)))\u{00B0}"
                temperatureDescriptionLabel.text = description
            }
        }
    }

    
    func toggleLoadingView(isHidden: Bool) {
        if isHidden {
           loadingIndicatorView.stopAnimating()
        }else {
           loadingIndicatorView.startAnimating()
        }
        loadingView.isHidden = isHidden
        temperatureValueLabel.isHidden = !isHidden
        temperatureDescriptionLabel.isHidden = !isHidden
    }
    
    override var nibName: String {
        return "TemperatureInfoLabel"
    }
    
    public func updateStatus(to status: DataStatus) {
        self.status = status
    }
    
    public var valueLabelFontSize: CGFloat = 16 {
        didSet {
            temperatureValueLabel.font = UIFont.boldSystemFont(ofSize: valueLabelFontSize)
        }
    }
    public var descriptionLabelFontSize: CGFloat = 12 {
        didSet {
            temperatureDescriptionLabel.font = UIFont.systemFont(ofSize: descriptionLabelFontSize)
        }
    }
}
