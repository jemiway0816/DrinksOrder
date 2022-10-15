//
//  DrinksTableViewController.swift
//  DrinksOrder
//
//  Created by Jemiway on 2022/9/28.
//

import UIKit

class DrinksTableViewController: UITableViewController {

    var Drinks:[[DrinkItem]] =
    [
        [
           DrinkItem(drinkName: "冬瓜鮮乳", priceMiddle: 65, priceBig: 65, description: "古早味手工熬製的冬瓜露配上鮮乳坊小農鮮乳，大口喝下能嚐到兩者豐富的濃郁香氣 ，溫順又讓人越喝越上癮，讓人一喝就難以忘懷。",picture: "Tea_02",shortDescription:"冬瓜露配上鮮乳坊小農鮮乳"),
            DrinkItem(drinkName: "百香紅茶", priceMiddle: 50, priceBig: 50, description: "夏天消暑好夥伴！口味甘美、酸甜可口的百香果配上龜記的極品紅茶，推薦給喜歡酸甜滋味的你。",picture: "Tea_03",shortDescription:"百香果配上龜記的極品紅茶"),
            DrinkItem(drinkName: "秀水旺梨春", priceMiddle: 65, priceBig: 65, description: "來自彰化秀水的土鳳梨汁加上台灣產四季春青茶。口感清爽，古早味的酸甜滋味。",picture: "Tea_04",shortDescription:"鳳梨汁加上台灣產四季春青茶"),
            DrinkItem(drinkName: "紅水烏龍", priceMiddle: 35, priceBig: 35, description: "來自台灣的白毫烏龍，茶湯近琥珀色。茶韻帶濃郁果香，清爽順口不苦澀。",picture: "Tea_05",shortDescription:"白毫烏龍"),
            DrinkItem(drinkName: "紅烏鮮乳＋珍珠", priceMiddle: 69, priceBig: 69, description: "散發果香的紅水烏龍，碰撞上鮮乳坊小農鮮乳，最後加入入龜記QQ好吃晶瑩剔透的黃金珍珠，就是店內必點的招牌必點人氣商品！",picture: "Tea_06",shortDescription:"紅水烏龍+小農鮮乳+黃金珍珠"),
            DrinkItem(drinkName: "翡翠雷夢", priceMiddle: 55, priceBig: 55, description: "龜記翡翠綠茶跟新鮮檸檬，兩者比例搭配恰到好處，初戀的味道。",picture: "Tea_07",shortDescription:"翡翠綠茶+新鮮檸檬"),
            DrinkItem(drinkName: "香柚雷夢綠", priceMiddle: 69, priceBig: 69, description: "以翡翠綠茶為基底，搭配上韓國柚子蜜與新鮮檸檬後再加入些許蘆薈。柚子果肉、檸檬、蘆薈的完美比例，多層次口感讓你一杯接一杯。",picture: "Tea_08",shortDescription:"翡翠綠茶+柚子果肉+檸檬+蘆薈")
        ],
        [
            DrinkItem(drinkName: "龍眼紅烏", priceMiddle: 89, priceBig: 89, description: "",picture: "Tea_09",shortDescription:""),
            DrinkItem(drinkName: "四季春青茶", priceMiddle: 35, priceBig: 35, description: "",picture: "Tea_09",shortDescription:""),
            DrinkItem(drinkName: "老欉鐵觀音", priceMiddle: 35, priceBig: 35, description: "",picture: "Tea_09",shortDescription:""),
            DrinkItem(drinkName: "極品紅茶", priceMiddle: 30, priceBig: 30, description: "",picture: "Tea_09",shortDescription:""),
            DrinkItem(drinkName: "三韻紅萱", priceMiddle: 40, priceBig: 40, description: "",picture: "Tea_09",shortDescription:""),
            DrinkItem(drinkName: "翡翠綠茶", priceMiddle: 30, priceBig: 30, description: "",picture: "Tea_09",shortDescription:""),
            DrinkItem(drinkName: "三十三茶王", priceMiddle: 40, priceBig: 40, description: "",picture: "Tea_09",shortDescription:""),
            DrinkItem(drinkName: "蜂蜜綠茶", priceMiddle: 45, priceBig: 45, description: "",picture: "Tea_09",shortDescription:""),
            DrinkItem(drinkName: "蜂蜜四季春", priceMiddle: 50, priceBig: 50, description: "",picture: "Tea_09",shortDescription:"")
        ],
        [
            DrinkItem(drinkName: "小農鮮乳茶(紅茶)", priceMiddle: 65, priceBig: 65, description: "",picture: "Tea_10",shortDescription:""),
            DrinkItem(drinkName: "小農鮮乳茶(翡翠)", priceMiddle: 65, priceBig: 65, description: "",picture: "Tea_10",shortDescription:""),
            DrinkItem(drinkName: "小農鮮乳茶(鐵觀音)", priceMiddle: 65, priceBig: 65, description: "",picture: "Tea_10",shortDescription:""),
            DrinkItem(drinkName: "龜記濃乳茶", priceMiddle: 65, priceBig: 65, description: "",picture: "Tea_10",shortDescription:""),
            DrinkItem(drinkName: "巧克鮮乳茶", priceMiddle: 69, priceBig: 69, description: "",picture: "Tea_10",shortDescription:"")
        ],
        [
            DrinkItem(drinkName: "阿源楊桃(紅茶)", priceMiddle: 55, priceBig: 55, description: "",picture: "Tea_11",shortDescription:""),
            DrinkItem(drinkName: "阿源楊桃(翡翠)", priceMiddle: 55, priceBig: 55, description: "",picture: "Tea_11",shortDescription:""),
            DrinkItem(drinkName: "楊桃雷夢", priceMiddle: 60, priceBig: 60, description: "",picture: "Tea_11",shortDescription:""),
            DrinkItem(drinkName: "冬瓜雷夢", priceMiddle: 55, priceBig: 55, description: "",picture: "Tea_11",shortDescription:""),
            DrinkItem(drinkName: "冬瓜鐵觀音", priceMiddle: 45, priceBig: 45, description: "",picture: "Tea_11",shortDescription:""),
            DrinkItem(drinkName: "豆漿紅茶", priceMiddle: 40, priceBig: 40, description: "",picture: "Tea_11",shortDescription:""),
            DrinkItem(drinkName: "珍珠奶茶(紅茶)", priceMiddle: 55, priceBig: 55, description: "",picture: "Tea_11",shortDescription:""),
            DrinkItem(drinkName: "珍珠奶茶(翡翠)", priceMiddle: 55, priceBig: 55, description: "",picture: "Tea_11",shortDescription:""),
            DrinkItem(drinkName: "珍珠奶茶(鐵觀音)", priceMiddle: 55, priceBig: 55, description: "",picture: "Tea_11",shortDescription:""),
            DrinkItem(drinkName: "極品奶茶(紅茶)", priceMiddle: 50, priceBig: 50, description: "",picture: "Tea_11",shortDescription:""),
            DrinkItem(drinkName: "極品奶茶(翡翠)", priceMiddle: 50, priceBig: 50, description: "",picture: "Tea_11",shortDescription:""),
            DrinkItem(drinkName: "極品奶茶(鐵觀音)", priceMiddle: 50, priceBig: 50, description: "",picture: "Tea_11",shortDescription:"")
        ],
        [
            DrinkItem(drinkName: "金桔拜觀音", priceMiddle: 55, priceBig: 55, description: "",picture: "Tea_12",shortDescription:""),
            DrinkItem(drinkName: "鮮果百香(紅茶)", priceMiddle: 55, priceBig: 55, description: "",picture: "Tea_12",shortDescription:""),
            DrinkItem(drinkName: "鮮果百香(翡翠)", priceMiddle: 55, priceBig: 55, description: "",picture: "Tea_12",shortDescription:""),
            DrinkItem(drinkName: "蜂蜜雷夢", priceMiddle: 60, priceBig: 60, description: "",picture: "Tea_12",shortDescription:""),
            DrinkItem(drinkName: "雷夢蘆薈蜜", priceMiddle: 65, priceBig: 65, description: "",picture: "Tea_12",shortDescription:""),
            DrinkItem(drinkName: "柳丁翡翠", priceMiddle: 55, priceBig: 55, description: "",picture: "Tea_12",shortDescription:""),
            DrinkItem(drinkName: "紫葡蘆薈春", priceMiddle: 69, priceBig: 69, description: "",picture: "Tea_12",shortDescription:""),
            DrinkItem(drinkName: "玉荷包茶王", priceMiddle: 80, priceBig: 80, description: "",picture: "Tea_12",shortDescription:"")
        ]
        
//        [
//            DrinkItem(drinkName: "黑木耳鮮乳", priceMiddle: 65, priceBig: 65, description: "",picture: "Tea_13",shortDescription:""),
//            DrinkItem(drinkName: "手作薑茶", priceMiddle: 45, priceBig: 45, description: "",picture: "Tea_13",shortDescription:""),
//            DrinkItem(drinkName: "桂圓紅棗茶", priceMiddle: 55, priceBig: 55, description: "",picture: "Tea_13",shortDescription:""),
//            DrinkItem(drinkName: "薑汁奶茶", priceMiddle: 55, priceBig: 55, description: "",picture: "Tea_13",shortDescription:""),
//            DrinkItem(drinkName: "薑汁雷夢", priceMiddle: 55, priceBig: 55, description: "",picture: "Tea_13",shortDescription:""),
//            DrinkItem(drinkName: "薑汁桂圓", priceMiddle: 55, priceBig: 55, description: "",picture: "Tea_13",shortDescription:""),
//            DrinkItem(drinkName: "擂茶豆漿", priceMiddle: 65, priceBig: 65, description: "",picture: "Tea_13",shortDescription:"")
//        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 修改 section header 樣式
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        let label = UILabel()
        label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        label.font = .systemFont(ofSize: 32)
        label.textColor = .black

        switch section {
        case 0:
            label.text = "極品推薦"
        case 1:
            label.text = "醇萃系列"
        case 2:
            label.text = "小農鮮乳坊"
        case 3:
            label.text = "古早味"
        case 4:
            label.text = "鮮調"
        case 5:
            label.text = "冬季限定"
        default:
            break
        }
        headerView.addSubview(label)
        return headerView
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    @IBSegueAction func showOrder(_ coder: NSCoder) -> OrderTableViewController? {
        
        let controller = OrderTableViewController(coder: coder)
         
        if let section = tableView.indexPathForSelectedRow?.section,
           let row = tableView.indexPathForSelectedRow?.row {
            
            controller?.drink = Drinks[section][row]
        }
        
        return controller
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return Drinks.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Drinks[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(DrinkTableViewCell.self)", for: indexPath) as! DrinkTableViewCell
        let drink = Drinks[indexPath.section][indexPath.row]
        cell.nameLabel.text = drink.drinkName
        cell.priceLabel.text = "NT$\(drink.priceMiddle)"
        cell.decriptLabel.text = drink.shortDescription
        cell.picImageView.image = UIImage(named: drink.picture)
        cell.picImageView.layer.cornerRadius = 10
        
        switch indexPath.section {
        case 0:
            cell.backgroundColor = UIColor(red: 0, green: 0, blue: 0.5, alpha: 0.3)
        case 1:
            cell.backgroundColor = UIColor(red: 0, green: 0.5, blue: 0.5, alpha: 0.3)
        case 2:
            cell.backgroundColor = UIColor(red: 0, green: 0.5, blue: 0, alpha: 0.3)
        case 3:
            cell.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0, alpha: 0.3)
        case 4:
            cell.backgroundColor = UIColor(red: 0.5, green: 0, blue: 0, alpha: 0.3)
        case 5:
            cell.backgroundColor = UIColor(red: 0.5, green: 0, blue: 0.5, alpha: 0.3)
        default:
            break
        }
        
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
