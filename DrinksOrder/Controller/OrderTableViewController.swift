//
//  OrderTableViewController.swift
//  DrinksOrder
//
//  Created by Jemiway on 2022/9/28.
//

import UIKit

class OrderTableViewController: UITableViewController {

    var drink:DrinkItem!
    var section = 0
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var picImageView: UIImageView!
    @IBOutlet var descriLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var orderName: UITextField!
    @IBOutlet var sugarSegCtl: UISegmentedControl!
    @IBOutlet var iceSegCtl: UISegmentedControl!
    @IBOutlet var pearlSegCtl: UISegmentedControl!
    
    // 設定cell的背景色
    @IBOutlet var tableViewCell_0: DrinkTableViewCell!
    @IBOutlet var tableViewCell_1: DrinkTableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 顯示飲料資訊
        picImageView.layer.cornerRadius = 10
        nameLabel.text = drink.drinkName
        priceLabel.text = "NT$\(drink.priceMiddle)"
        descriLabel.text = drink.description
        picImageView.image = UIImage(named: drink.picture)
        
        // 取得 drinksTableViewController
        let navController = tabBarController?.viewControllers?[0] as? UINavigationController
        let drinksTableViewController = navController?.viewControllers.first as? DrinksTableViewController
        
        // 設定cell的背景色
        tableViewCell_1.backgroundColor = drinksTableViewController?.getBackgroundColor(section)
    }

    
    @IBAction func nameDidEndOnExit(_ sender: Any) {
        print("nameDidEndOnExit")
    }
      
    @IBAction func doneButton(_ sender: Any) {
        
        // 取得訂單唯一key
        let uuidStr = UUID().uuidString
        let name = orderName.text ?? ""
        let drink = nameLabel.text ?? ""
        let sugar = sugarSegCtl.selectedSegmentIndex
        let ice = iceSegCtl.selectedSegmentIndex
        let pearl = pearlSegCtl.selectedSegmentIndex
        let today = Date()
        
        // 產生訂單
        let order = Order(uuid: uuidStr,section: self.section, orderName: name, drinkName: drink, sugar: sugar, ice: ice, pearl: pearl, orderTime: today)

        // 設定sheetDB的request header，method為post
        let url = URL(string: "\(apiKey)")!
        var request = URLRequest(url: url)
        request.httpMethod = "post"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // 產生 encoder
        let encoder = JSONEncoder()
        
        // 設定encoder的日期格式
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/M/d HH:mm"
        encoder.dateEncodingStrategy = .formatted(dateFormatter)
        
        // 設定sheetDB的request body
        request.httpBody = try? encoder.encode(order)
        
        // 發出 request
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data {
                do {
                    // 讀入傳回的data並解碼成dic
                    let decoder = JSONDecoder()
                    let dic = try decoder.decode([String: Int].self, from: data)
                    
                    // 確認post成功
                    if dic["created"] == 1 {
                        
                        // 在主執行緒顯示UI
                        DispatchQueue.main.async {
                            
                            // 顯示訂單確認訊息框
                            let controller = UIAlertController(title: "訂單確認",
                                    message: "已訂購 \(drink) 1 杯", preferredStyle: .alert)
                            let okAction = UIAlertAction(title: "OK", style: .default) { alert in
                                self.navigationController?.popViewController(animated: true)
                            }
                            controller.addAction(okAction)
                            self.present(controller, animated: true , completion: nil)
                        }
                    }
                } catch {
                    // 解碼失敗
                    print(error)
                }
            } else {
                // 無法取得data
                print("data error")
            }
        }.resume()
    }
}
