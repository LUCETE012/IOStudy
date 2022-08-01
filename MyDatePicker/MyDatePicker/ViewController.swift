//
//  ViewController.swift
//  MyDatePicker
//
//  Created by 김준엽 on 2022/07/28.
//

import UIKit

class ViewController: UIViewController {
     
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
//        formatter.dateStyle = .medium
//        formatter.timeStyle = .medium
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
        return formatter
    }()
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker){
        print("value changed")
        
        let date: Date = self.datePicker.date
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.dateLabel.text = dateString
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
    }


}

