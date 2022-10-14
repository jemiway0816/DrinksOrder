//
//  DrinksTableViewController.swift
//  DrinksOrder
//
//  Created by Jemiway on 2022/9/28.
//

import UIKit

class DrinksTableViewController: UITableViewController {

    var Drinks:[DrinkItem] = [

        DrinkItem(drinkName: "熟成紅茶", priceMiddle: 30, priceBig: 35, decription: "解炸物/燒烤肉類油膩，茶味濃郁帶果香",picture: "RedTea_01"),
        DrinkItem(drinkName: "麗春紅茶", priceMiddle: 30, priceBig: 35, decription: "去除海鮮羶腥，茶味較淡帶花香",picture: "RedTea_02"),
        DrinkItem(drinkName: "太妃紅茶", priceMiddle: 35, priceBig: 40, decription: "咖啡與茶的神秘比例搭配",picture: "RedTea_03"),
        DrinkItem(drinkName: "胭脂紅茶", priceMiddle: 40, priceBig: 45, decription: "絲絨般的蜜桃果香",picture: "RedTea_04"),
        DrinkItem(drinkName: "春芽綠茶", priceMiddle: 30, priceBig: 35, decription: "綠茶，系系中帶點彔彔",picture: "RedTea_05"),
        DrinkItem(drinkName: "雪花冷露", priceMiddle: 30, priceBig: 35, decription: "手工冬瓜獨奏",picture: "RedTea_06"),
        DrinkItem(drinkName: "熟成冷露", priceMiddle: 30, priceBig: 35, decription: "手工冬瓜與茶更神秘比例搭配",picture: "RedTea_07"),
        DrinkItem(drinkName: "春芽冷露", priceMiddle: 30, priceBig: 35, decription: "手工冬瓜綠茶",picture: "RedTea_08"),
        DrinkItem(drinkName: "春梅冰茶", priceMiddle: 40, priceBig: 50, decription: "春梅與冬瓜相遇",picture: "RedTea_09"),
        DrinkItem(drinkName: "熟成檸果", priceMiddle: 55, priceBig: 55, decription: "每日限量的鮮檸紅茶，整顆檸檬搭配7分糖最佳",picture: "RedTea_10"),
        DrinkItem(drinkName: "雪藏紅茶", priceMiddle: 50, priceBig: 60, decription: "冰淇淋與紅茶的綿綿情意",picture: "RedTea_11"),
        DrinkItem(drinkName: "冷露歐蕾", priceMiddle: 45, priceBig: 55, decription: "手工冬瓜與鮮奶",picture: "RedTea_12"),
        DrinkItem(drinkName: "熟成歐蕾", priceMiddle: 45, priceBig: 55, decription: "熟成鮮奶茶",picture: "RedTea_13"),
        DrinkItem(drinkName: "白玉歐蕾", priceMiddle: 55, priceBig: 65, decription: "珍奶不解釋",picture: "RedTea_14"),
        DrinkItem(drinkName: "冷露檸果", priceMiddle: 55, priceBig: 65, decription: "古法熬煮冬瓜與整顆鮮切檸檬",picture: "RedTea_15"),
        DrinkItem(drinkName: "荔麗紅茶", priceMiddle: 60, priceBig: 70, decription: "荔枝與麗春的午茶假期",picture: "RedTea_16"),
        DrinkItem(drinkName: "胭脂多多", priceMiddle: 45, priceBig: 55, decription: "蜜桃裡的兒時記憶",picture: "RedTea_17")
    ]
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBSegueAction func showOrder(_ coder: NSCoder) -> OrderTableViewController? {
        
        let controller = OrderTableViewController(coder: coder)
         
        if let row = tableView.indexPathForSelectedRow?.row {
            
            controller?.drink = Drinks[row]
        }
        
        return controller
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Drinks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(DrinkTableViewCell.self)", for: indexPath) as! DrinkTableViewCell

        let drink = Drinks[indexPath.row]
        
        cell.nameLabel.text = drink.drinkName
        cell.priceLabel.text = "中 : \(drink.priceMiddle)  /  大 : \(drink.priceBig)"
        cell.decriptLabel.text = drink.decription
        cell.picImageView.image = UIImage(named: drink.picture)
        
        return cell
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
