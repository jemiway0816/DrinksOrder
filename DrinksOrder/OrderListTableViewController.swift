//
//  OrderListTableViewController.swift
//  DrinksOrder
//
//  Created by Jemiway on 2022/9/28.
//

import UIKit

class OrderListTableViewController: UITableViewController {

    var orders = [Order]()
    
    let cupSize:[String] = ["中杯","大杯"]
    let sugar:[String] = ["無糖","微糖","半糖","正常"]
    let ice:[String] = ["去冰","少冰","正常"]
    let pearl:[String] = ["不加珍珠","加珍珠"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fetch()
    }
    
    func fetch() {
        
        let url = URL(string: "https://sheetdb.io/api/v1/o8bn2eh4kry27?cast_numbers=cupSize,sugar,ice,pearl")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data {
                
                do {
                    let decoder = JSONDecoder()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy/M/d HH:mm"
                    decoder.dateDecodingStrategy = .formatted(dateFormatter)
                    self.orders = try decoder.decode([Order].self, from: data)
                    
                    print(self.orders)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                } catch {
                    print(error)
                }
            } else {
                print("no data ")
            }
                
        }.resume()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return orders.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(OrderTableViewCell.self)", for: indexPath) as! OrderTableViewCell

        let order = orders[indexPath.row]
        
        cell.orderNameLabel.text = order.orderName
        cell.drinkNameLabel.text = order.drinkName
        
        cell.cupSizeLabel.text = cupSize[order.cupSize]
        cell.sugarLabel.text = sugar[order.sugar]+ice[order.ice]
        cell.pearlLabel.text = pearl[order.pearl]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/M/d HH:mm"
        cell.dateLabel.text = dateFormatter.string(from: order.orderTime)
        
        return cell
    }
    

//    trailingSwipeActionsConfigurationForRowAt
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //產生第一個按鈕
        let buttonDelete = UIContextualAction(style: .normal, title: "刪除") { action, view, complete
            in
            print("刪除按鈕被按下！")
            
            //Step2.刪除資料集的資料
            
//        https://sheetdb.io/api/v1/o8bn2eh4kry27/orderName/gifs
//            self.arrTable.remove(at: indexPath.row)
            let order = self.orders[indexPath.row]
            let urlStr = "https://sheetdb.io/api/v1/o8bn2eh4kry27/orderName/\(order.orderName)"
            if let url = URL(string: urlStr) {
                
                var request = URLRequest(url: url)
                request.httpMethod = "delete"
                
                URLSession.shared.dataTask(with: request) { data, response, error in
                    
                    if let response = response as? HTTPURLResponse {
                        print(response.statusCode)
                        
                        DispatchQueue.main.async {
                            self.fetch()
                            self.tableView.reloadData()
                        }
                    }
                }.resume()
            }
           
//            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        buttonDelete.backgroundColor = .systemRed
        let config = UISwipeActionsConfiguration(actions: [buttonDelete])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
