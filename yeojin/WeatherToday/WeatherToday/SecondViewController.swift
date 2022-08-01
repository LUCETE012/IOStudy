//
//  SecondViewController.swift
//  WeatherToday
//
//  Created by 김여진 on 2022/07/31.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var textToSet: String!
    
    let cellIdentifier: String = "weathercell"
    
    var informations: [WeatherInfo] = []
    var r: Int!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info: WeatherInfo = self.informations[indexPath.row]
        
        let weathercell: Weathercell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! Weathercell
        r = indexPath.row
        
        let city: String = info.cityName
        weathercell.cityLabel.text = city

        var img: UIImage! = UIImage()
        
        if info.state == 10 {
            img = UIImage(named: "sunny.png")
            weathercell.state = "해"
            
        } else if info.state == 11 {
            img = UIImage(named: "cloudy.png")
            weathercell.state = "구름"
            
        } else if info.state == 12 {
            img = UIImage(named: "rainy.png")
            weathercell.state = "비"

        } else if info.state == 13 {
            img = UIImage(named: "snowy.png")
            weathercell.state = "눈"

        }
        
        
        weathercell.weatherImg.image = img
        
        let tem: Float = informations[indexPath.row].celsius
        let fah = (tem * 1.8) + 32
        
        
        weathercell.temLabel.text = "섭씨 \(tem)도 / 화씨 \(fah)도"
    
        let per: Int = informations[indexPath.row].rainfallProbability
        weathercell.perLabel.text = "강수확률 \(per)%"

        return weathercell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.informations.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
       
        
       
        
        if textToSet! == "한국" {
            let jsonDecoder: JSONDecoder = JSONDecoder()
            guard let dataAsset: NSDataAsset = NSDataAsset(name: "kr") else {
                    return
                }
                
            do {
                    self.informations = try jsonDecoder.decode([WeatherInfo].self, from: dataAsset.data)
                } catch {
                    print(error)
            }
        } else if textToSet! == "독일" {
            let jsonDecoder: JSONDecoder = JSONDecoder()
            guard let dataAsset: NSDataAsset = NSDataAsset(name: "de") else {
                    return
                }
                
            do {
                    self.informations = try jsonDecoder.decode([WeatherInfo].self, from: dataAsset.data)
                } catch {
                    print(error)
            }
        } else if textToSet! == "이탈리아" {
            let jsonDecoder: JSONDecoder = JSONDecoder()
            guard let dataAsset: NSDataAsset = NSDataAsset(name: "it") else {
                    return
                }
                
            do {
                    self.informations = try jsonDecoder.decode([WeatherInfo].self, from: dataAsset.data)
                } catch {
                    print(error)
            }
        } else if textToSet! == "미국" {
            let jsonDecoder: JSONDecoder = JSONDecoder()
            guard let dataAsset: NSDataAsset = NSDataAsset(name: "us") else {
                    return
                }
                
            do {
                    self.informations = try jsonDecoder.decode([WeatherInfo].self, from: dataAsset.data)
                } catch {
                    print(error)
            }
        } else if textToSet! == "프랑스" {
            let jsonDecoder: JSONDecoder = JSONDecoder()
            guard let dataAsset: NSDataAsset = NSDataAsset(name: "fr") else {
                    return
                }
                
            do {
                    self.informations = try jsonDecoder.decode([WeatherInfo].self, from: dataAsset.data)
                } catch {
                    print(error)
            }
        } else if textToSet! == "일본" {
            let jsonDecoder: JSONDecoder = JSONDecoder()
            guard let dataAsset: NSDataAsset = NSDataAsset(name: "jp") else {
                    return
                }
            do {
                    self.informations = try jsonDecoder.decode([WeatherInfo].self, from: dataAsset.data)
                } catch {
                    print(error)
            }
        }

        self.tableView.reloadData()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.title = textToSet

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        // view가 여러개면 이걸로 구분 가능
//        segue.identifier
        guard let nextViewController: ThirdViewController = segue.destination as? ThirdViewController else {
            return
        }
        
        guard let cell: Weathercell = sender as?
            Weathercell else {
            return
        }
        

        nextViewController.img = cell.weatherImg.image
        nextViewController.state = cell.state
        nextViewController.tem = cell.temLabel.text
        nextViewController.per = cell.perLabel.text
        nextViewController.city = cell.cityLabel.text
    }

}
