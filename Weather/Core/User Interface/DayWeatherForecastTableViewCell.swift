//
//  DayWeatherForecastTableViewCell.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/12.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

class DayWeatherForecastTableViewCell: UITableViewCell {
    @IBOutlet private weak var dayLabel: UILabel!
    @IBOutlet private weak var weatherTypeImageView: UIImageView!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var loadingIndicatorView: UIActivityIndicatorView!
    
    public static var nibName: String = "DayWeatherForecastTableViewCell"
    public static var reuseIdentifier: String = "DayWeatherForecastTableViewCell"
    public static var nib: UINib {
        return UINib(nibName: nibName, bundle: nil)
    }
    private var status: DataStatus = .loading {
        didSet {
            switch status {
            case .available(let value , let description):
                loadingIndicatorView.stopAnimating()
                temperatureLabel.textColor = .white
                dayLabel.textColor = .white
                temperatureLabel.text =  "\(String(Int(value)))\u{00B0}"
                dayLabel.text = description
            case .loading:
                bringSubview(toFront: loadingIndicatorView)
                loadingIndicatorView.startAnimating()
                temperatureLabel.textColor = .white
                dayLabel.textColor = .white
                temperatureLabel.text =  "--"
                dayLabel.text = "--"
            case .missing:
                loadingIndicatorView.stopAnimating()
                temperatureLabel.textColor = .red
                dayLabel.textColor = .red
                temperatureLabel.text =  "**"
                dayLabel.text = "**"
            }
        }
    }
    private var weatherType: WeatherType = .unknown {
        didSet {
            weatherTypeImageView.image = weatherType.associatedIcon
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        temperatureLabel.textColor = .white
        dayLabel.textColor = .white
        contentView.backgroundColor = .black
        backgroundColor = .black
        bringSubview(toFront: loadingIndicatorView)
        loadingIndicatorView.startAnimating()
    }

    public func updateStatus(_ status: DataStatus, weatherType: WeatherType) {
        self.backgroundColor = weatherType.associatedColor
        contentView.backgroundColor = weatherType.associatedColor ?? .black
        self.status = status
        self.weatherType = weatherType
    }
}
