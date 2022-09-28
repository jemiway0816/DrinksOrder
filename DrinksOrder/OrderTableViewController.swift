//
//  OrderTableViewController.swift
//  DrinksOrder
//
//  Created by Jemiway on 2022/9/28.
//

import UIKit

class OrderTableViewController: UITableViewController {

    let apiKey = "https://sheetdb.io/api/v1/o8bn2eh4kry27"
    
    var drink:DrinkItem!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var picImageView: UIImageView!
    @IBOutlet var descriLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    @IBOutlet var orderName: UITextField!
    
    @IBOutlet var cupSizeSegCtl: UISegmentedControl!
    @IBOutlet var sugarSegCtl: UISegmentedControl!
    @IBOutlet var iceSegCtl: UISegmentedControl!
    @IBOutlet var pearlSegCtl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = drink.drinkName
        priceLabel.text = "中 : \(drink.priceMiddle)  /  大 : \(drink.priceBig)"
        descriLabel.text = drink.decription
        picImageView.image = UIImage(named: drink.picture)
    }

    @IBAction func doneButton(_ sender: Any) {
        
        let name = orderName.text ?? ""
        let drink = nameLabel.text ?? ""
        let cupSize = cupSizeSegCtl.selectedSegmentIndex
        let sugar = sugarSegCtl.selectedSegmentIndex
        let ice = iceSegCtl.selectedSegmentIndex
        let pearl = pearlSegCtl.selectedSegmentIndex
        let today = Date()
        let order = Order(orderName: name, drinkName: drink, cupSize: cupSize, sugar: sugar, ice: ice, pearl: pearl ,orderTime:today)
        
        let url = URL(string: "\(apiKey)")!
        var request = URLRequest(url: url)
        request.httpMethod = "post"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/M/d HH:mm"
        encoder.dateEncodingStrategy = .formatted(dateFormatter)
        request.httpBody = try? encoder.encode(order)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data {
                
                do {
                    let decoder = JSONDecoder()
                    let dic = try decoder.decode([String: Int].self, from: data)
                    
                    if dic["created"] == 1 {
                        print("OK")
                        
                        DispatchQueue.main.async {
                            self.navigationController?.popViewController(animated: true)
                        }
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    @IBAction func orderNameEndExit(_ sender: Any) {
        
    }
    
 
    


    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
