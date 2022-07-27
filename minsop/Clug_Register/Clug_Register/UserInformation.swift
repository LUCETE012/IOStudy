//
//  UserInformation.swift
//  Clug_Register
//
//  Created by 이민섭 on 2022/07/27.
//

import Foundation
import UIKit


class UserInformation{
    
    
    static let shared: UserInformation = UserInformation()
    
    
    var id: String?
    var password: String?
    
    var phoneNumber: String?
    var birthdaydate : String?
    var introducing: String?
    
    
    var image: UIImage?
    
    func printIDPASSWORD(){
        print("\(id)  ----  \(password) ")
    }
    
    func updateIdAndPassword(id: String, password: String , introducing: String ){
    
        self.id = id
        self.password = password
        self.introducing = introducing
    
    }
    
    func updateDetails( phoneNumber: String, birthdaydate: String  ){
        self.phoneNumber = phoneNumber
        self.birthdaydate = birthdaydate
    }
    
    
    
}
