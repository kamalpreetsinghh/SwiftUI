//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Kamal Preet Singh on 2022-05-12.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
