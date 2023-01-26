//
//  ViewController.swift
//  Sunny
//
//  Created by Ivan Akulov on 24/02/2020.
//  Copyright © 2020 Ivan Akulov. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
    
    var networkWeatherManager = NetworkWeatherManager()
    lazy var locationManager: CLLocationManager = {
        let lm = CLLocationManager()
        lm.delegate = self
        lm.desiredAccuracy = kCLLocationAccuracyKilometer
        lm.requestWhenInUseAuthorization()
        return lm
    }()
    
    @IBAction func searchPressed(_ sender: UIButton) {
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { [unowned self] city in
            self.networkWeatherManager.fetchCurrentWeather(forCity: city) //{ currentWeather in
//                print(currentWeather.cityName)
//            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        networkWeatherManager.delegate = self
        networkWeatherManager.onCompletion = { [weak self] currentWeather in
//            print(currentWeather.cityName)
            guard let self = self else {return}
            self.updateInterfaceWith(weather: currentWeather)
            
            
        }
//        networkWeatherManager.fetchCurrentWeather(forCity: "London") //{ currentWeather in
//            print(currentWeather.cityName)
//        }
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestLocation()
        }
        
     }
    
    func updateInterfaceWith(weather: CurrentWeather) {
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.temperatureString
            self.feelsLikeTemperatureLabel.text = weather.feelsLikeTemperatureString
            self.weatherIconImageView.image = UIImage(systemName: weather.systemIconNameString)
        }
    }
    
}


//extension ViewController: NetworkWeatherManagerDelegate {
//    func updateInterface(_: NetworkWeatherManager, with currentWeather: CurrentWeather) {
//        print(currentWeather.cityName)
//    }
//}

extension ViewController: CLLocationManagerDelegate {
    
    
}
