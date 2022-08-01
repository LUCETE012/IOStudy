//
//  WeatherInfo.swift
//  WeatherToday
//
//  Created by 김여진 on 2022/08/01.
//

import Foundation


class WeatherInfo: Codable {
    
    let cityName: String
    let state: Int
    let celsius: Float
    let rainfallProbability: Int
    
    enum CodingKeys: String, CodingKey {
        case cityName = "city_name"
        case state, celsius
        case rainfallProbability = "rainfall_probability"
    }
    
}
