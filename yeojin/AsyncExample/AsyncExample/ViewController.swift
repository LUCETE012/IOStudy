//
//  ViewController.swift
//  AsyncExample
//
//  Created by 김여진 on 2022/08/07.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func touchUpDownloadButton(_ sender: UIButton) {
        // 이미지 다운로드 -> 이미지 뷰에 셋팅
        
        //http://eskipaper.com/images/large-2.jpg
        
        let imageURL: URL = URL(string: "http://eskipaper.com/images/large-2.jpg")!
        
        // 이게 동기 메소드라서 이게 끝나기 전까지는 다음 줄로 안넘어감 -> 작업이 끝날 때까지 앱이 멈춰있음
//        let imageData: Data = try! Data.init(contentsOf: imageURL)
//        // 느낌표 쓰는게 나쁜 코딩이라는데 느낌표 안쓰고는 어떻게 함 .....?
//        let image: UIImage = UIImage(data: imageData)!
//
//        self.imageView.image = image
        
        // 프리징 안됨
        OperationQueue().addOperation {
            let imageData: Data = try! Data.init(contentsOf: imageURL)
            let image: UIImage = UIImage(data: imageData)!
            
            OperationQueue.main.addOperation {
                self.imageView.image = image
            }

        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

