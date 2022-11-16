//
//  OrderListTableViewController.swift
//  DrinksOrder
//
//  Created by Jemiway on 2022/9/28.
//

import UIKit

class OrderListTableViewController: UITableViewController {

    var orders = [Order]()
    
    let sugar:[String] = ["正常糖","八分糖","半糖","三分糖","一分糖","無糖"]
    let ice:[String] = ["正常冰","少冰","去冰","熱","微冰"]
    let pearl:[String] = ["無","珍珠","蘆薈","椰果"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 讀取全部訂單資訊
        fetch()
    }
    
    func fetch() {
        // 取得全部訂單資訊的網址
        let url = URL(string: "\(apiKey)?cast_numbers=section,sugar,ice,pearl")!
        
        // 執行url
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data {
                do {
                    // 產生decoder
                    let decoder = JSONDecoder()
                    
                    // 設定日期格式到decoder
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy/M/d HH:mm"
                    decoder.dateDecodingStrategy = .formatted(dateFormatter)
                    
                    // 解碼data後存進order訂單資料陣列
                    self.orders = try decoder.decode([Order].self, from: data)
                    
                    // 重新顯示tableView
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    // 解碼失敗
                    print(error)
                }
            } else {
                // 無傳回data
                print("no data ")
            }
        }.resume()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 取得要顯示的cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(OrderTableViewCell.self)", for: indexPath) as! OrderTableViewCell

        // 準備tableview cell顯示資料
        let order = orders[indexPath.row]
        cell.idLabel.text = String(indexPath.row+1)
        cell.orderNameLabel.text = order.orderName
        cell.drinkNameLabel.text = order.drinkName
        cell.sugarLabel.text = sugar[order.sugar]+ice[order.ice]
        
        // 是否有加珍珠
        if order.pearl != 0 {
            cell.pearlLabel.text = "加\(pearl[order.pearl])"
        } else {
            cell.pearlLabel.text = ""
        }
        
        // 取得 drinksTableViewController
        let navController = tabBarController?.viewControllers?[0] as? UINavigationController
        let drinksTableViewController = navController?.viewControllers.first as? DrinksTableViewController
   
        // 改變背景色
        cell.backgroundColor = drinksTableViewController?.getBackgroundColor(order.section)

        // 準備顯示的日期格式
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/M/d HH:mm"
        cell.dateLabel.text = dateFormatter.string(from: order.orderTime)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        // 準備刪除按鈕
        let buttonDelete = UIContextualAction(style: .normal, title: "刪除") { action, view, complete
            in
            print("刪除按鈕被按下！")
            let order = self.orders[indexPath.row]
            
            // 刪除的url，填入要刪除飲料的唯一key
            let urlStr = "\(apiKey)/uuid/\(order.uuid)"
            
            if let url = URL(string: urlStr) {
                
                // 依url產生request，並設定method為delete
                var request = URLRequest(url: url)
                request.httpMethod = "delete"
                
                // 發出request
                URLSession.shared.dataTask(with: request) { data, response, error in
                    
                    // 讀取並顯示response statusCode
                    if let response = response as? HTTPURLResponse {
                        print(response.statusCode)
                        
                        // 重新讀取全部訂單資訊並刷新tableView
                        DispatchQueue.main.async {
                            self.fetch()
                            self.tableView.reloadData()
                        }
                    }
                }.resume()
            }
        }
        
        // 設定delete按鈕
        buttonDelete.backgroundColor = .systemRed
        let config = UISwipeActionsConfiguration(actions: [buttonDelete])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
}
