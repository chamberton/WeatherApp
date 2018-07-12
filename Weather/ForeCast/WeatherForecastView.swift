
//
//  WeatherForecastView.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

protocol WeatherForecastView: class {
    func updateSummaryView(weatherType: WeatherType, status: DataStatus)
    func updateDetailView(weatherType: WeatherType, statuses: [DataStatus])
    func reloadNextFiveDaysForecastView(weatherType: WeatherType)
    func showFiveDaysForecastFailureView()
    func showCurrentWeatherFailureView()
    func updatefiveDaysViewBackgroundColor(_ color: UIColor?)
    func showOfflineAlert()
}
