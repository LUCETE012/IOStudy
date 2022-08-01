//
//  ViewController.swift
//  WeatherToday
//
//  Created by 김여진 on 2022/07/31.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier: String = "cell"
    
    var countries: [Country] = []
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let country: Country = self.countries[indexPath.row]
        
        let cell: Countrycell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! Countrycell
        
        let text: String = country.koreanName
        cell.nameLabel.text = text
        
        let img = UIImage(named: "flag_\(country.assetName).png")
        cell.imgView.image = img
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        self.tableView.delegate = self
        self.tableView.dataSource = self

        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else {
                return
            }
            
        do {
                self.countries = try jsonDecoder.decode([Country].self, from: dataAsset.data)
            } catch {
                print(error)
        }
        self.tableView.reloadData()
        
        self.navigationItem.title = "세계 날씨"
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        guard let nextViewController: SecondViewController = segue.destination as? SecondViewController else {
            return
        }
        
        guard let cell: Countrycell = sender as? Countrycell else {
            return
        }
        
        nextViewController.textToSet = cell.nameLabel.text
    }
    
}

