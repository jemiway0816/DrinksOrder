//
//  order.swift
//  DrinksOrder
//
//  Created by Jemiway on 2022/9/28.
//

import Foundation

struct Order: Codable {
    let uuid:String
    let section:Int
    let orderName:String
    let drinkName:String
    let sugar: Int
    let ice: Int
    let pearl: Int
    let orderTime:Date
}


