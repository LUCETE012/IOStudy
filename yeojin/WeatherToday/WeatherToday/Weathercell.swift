//
//  Weathercell.swift
//  WeatherToday
//
//  Created by 김여진 on 2022/08/01.
//

import UIKit

class Weathercell: UITableViewCell {

    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temLabel: UILabel!
    @IBOutlet weak var perLabel: UILabel!
    
    var state: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
