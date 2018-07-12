//
//  WeatherForecastViewController.swift
//  Weather
//
//  Created by Serge Mbamba on 2018/07/07.
//  Copyright © 2018 Momentum. All rights reserved.
//

import UIKit

class WeatherForecastViewController: UIViewController, Logger {
    @IBOutlet private weak var summaryTemperatureLabel: TemperatureInfoLabel!
    @IBOutlet private weak var currentWeatherBoundaryView: UIView!
    @IBOutlet private weak var summaryTemperatureImageView: UIImageView!
    @IBOutlet private weak var minTemperatureInfoLabel: TemperatureInfoLabel!
    @IBOutlet private weak var currentTemperatureInfoLabel: TemperatureInfoLabel!
    @IBOutlet private weak var maxTemperatureInfoLabel: TemperatureInfoLabel!
    @IBOutlet private weak var daylyWeatherForecastTableView: UITableView!
    @IBOutlet private weak var nextFiveDaysForecastFailureView: UIView!
    @IBOutlet private weak var retryReloadingFiveDaysForecastButton: UIButton!
    @IBOutlet private weak var failedFiveDaysForecastInfoLabel: UILabel!
    @IBOutlet private weak var currentWeatherFailureView: UIView!
    @IBOutlet private weak var retryCurrentWeatherButton: UIButton!
    @IBOutlet private weak var failedCurrentWeatherInfoLabel: UILabel!
    private(set) var weatherForecastPresenter = WeatherForecastPresenter()
    private var isShowingOfflineAlert = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDaylyWeatherForecastTableView()
        weatherForecastPresenter.weatherForecastView = self
        summaryTemperatureLabel.updateStatus(to: .loading)
        minTemperatureInfoLabel.updateStatus(to: .loading)
        currentTemperatureInfoLabel.updateStatus(to: .loading)
        maxTemperatureInfoLabel.updateStatus(to: .loading)
        toggleCurrentWeatheSummaryTableVisibility(isHidden: false)
        toggleNextFiveDaysTableVisibility(isHidden: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        weatherForecastPresenter.findUserLocation()
    }
    
    private func configureDaylyWeatherForecastTableView() {
        daylyWeatherForecastTableView.allowsSelection = false
        daylyWeatherForecastTableView.separatorStyle = .none
        daylyWeatherForecastTableView.delegate = self
        daylyWeatherForecastTableView.dataSource = weatherForecastPresenter
        daylyWeatherForecastTableView.register(DayWeatherForecastTableViewCell.nib, forCellReuseIdentifier: DayWeatherForecastTableViewCell.reuseIdentifier)
    }
    
    private func toggleNextFiveDaysTableVisibility(isHidden: Bool) {
        daylyWeatherForecastTableView.isHidden = isHidden
        nextFiveDaysForecastFailureView.isHidden = !isHidden
    }
    
    private func toggleCurrentWeatheSummaryTableVisibility(isHidden: Bool) {
        summaryTemperatureImageView.isHidden = isHidden
        summaryTemperatureLabel.isHidden = isHidden
        currentWeatherBoundaryView.isHidden = isHidden
        currentWeatherFailureView.isHidden = !isHidden
    }
    
    @IBAction private func didTapRetryFetchingCurrentWeatherInfo(_ sender: Any) {
        weatherForecastPresenter.loadCurrentWeatherInformation()
    }
    @IBAction private func didTapRetryFetchingFiveDayForecastInfo(_ sender: Any) {
         weatherForecastPresenter.loadNextFiveDaysWeatherForecast()
    }
}

extension WeatherForecastViewController: UITableViewDelegate { }

extension WeatherForecastViewController: WeatherForecastView {
    
    func updateSummaryView(weatherType: WeatherType, status: DataStatus) {
        summaryTemperatureImageView.image = weatherType.associatedImage
        view.backgroundColor = weatherType.associatedColor
        summaryTemperatureLabel.updateStatus(to: status)
        summaryTemperatureLabel.valueLabelFontSize = 48
        summaryTemperatureLabel.descriptionLabelFontSize = 32
    }
    
    func updateDetailView(weatherType: WeatherType, statuses: [DataStatus]) {
        guard statuses.count==3 else {
            log("Incorrect number of temperature information fetched: \(statuses.count)")
            return
        }
        toggleCurrentWeatheSummaryTableVisibility(isHidden: false)
        currentWeatherBoundaryView.backgroundColor = weatherType.associatedColor
        minTemperatureInfoLabel.updateStatus(to: statuses[0])
        currentTemperatureInfoLabel.updateStatus(to: statuses[1])
        maxTemperatureInfoLabel.updateStatus(to: statuses[2])
    }
    
    func reloadNextFiveDaysForecastView(weatherType: WeatherType) {
        toggleNextFiveDaysTableVisibility(isHidden: false)
        daylyWeatherForecastTableView.reloadData()
    }
    
    func showCurrentWeatherFailureView() {
         toggleCurrentWeatheSummaryTableVisibility(isHidden: true)
    }
    
    func showFiveDaysForecastFailureView() {
        toggleNextFiveDaysTableVisibility(isHidden: true)
    }
    
    func updatefiveDaysViewBackgroundColor(_ color: UIColor?) {
        daylyWeatherForecastTableView.backgroundColor = color
    }
    
    func showOfflineAlert() {
        guard isShowingOfflineAlert==false else {
            return
        }
        isShowingOfflineAlert = true
        let offlineTitle = "Failed to connect to the Internet"
        let message = "Your connection seems to be off. Please check and retry."
        let alert = UIAlertController( title:offlineTitle, message: message, preferredStyle: .alert)
        let destructiveAction = UIAlertAction.init(title: "OK", style: .cancel) {(_) in
            self.isShowingOfflineAlert = false
            return
        }
        alert.addAction(destructiveAction)
        present(alert, animated: true)
    }
}
