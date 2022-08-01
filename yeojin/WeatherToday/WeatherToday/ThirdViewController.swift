//
//  ThirdViewController.swift
//  WeatherToday
//
//  Created by 김여진 on 2022/08/01.
//

import Foundation
import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var temLabel: UILabel!
    @IBOutlet weak var perLabel: UILabel!
    
    var img: UIImage!
    var state: String!
    var tem: String!
    var per: String!
    var city: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if state == "해" {
            img = UIImage(named: "sunny.png")
            
        } else if state == "구름" {
            img = UIImage(named: "cloudy.png")

            
        } else if state == "비" {
            img = UIImage(named: "rainy.png")


        } else if state == "눈" {
            img = UIImage(named: "snowy.png")

        }
        
        
        imgView.image = img
        stateLabel.text = state
        temLabel.text = tem
        perLabel.text = per
        
        self.navigationItem.title = city
        
        
    }
    
    
}
