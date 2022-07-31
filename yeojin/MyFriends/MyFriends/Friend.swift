//
//  Friend.swift
//  MyFriends
//
//  Created by 김여진 on 2022/07/31.
//

import Foundation


struct Friend: Codable {
    
    struct Address: Codable {
        let country: String
        let city: String
    }
    
    let name: String
    let age: Int
    let addressInfo: Address
//    let address_info: Address
    
    var nameAndAge: String {
        return self.name + "(\(self.age))"
    }

    var fullAddress: String {
        return self.addressInfo.city + ", " + self.addressInfo.country
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case age
        case addressInfo = "address_info"
    }
    
}

