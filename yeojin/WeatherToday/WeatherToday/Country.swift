//
//  Country.swift
//  WeatherToday
//
//  Created by 김여진 on 2022/08/01.
//

import Foundation

class Country: Codable {
    
    let koreanName: String
    let assetName: String
    
    enum CodingKeys: String, CodingKey {
        case koreanName = "korean_name"
        case assetName = "asset_name"
    }
}
