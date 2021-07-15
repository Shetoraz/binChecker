//
//  BankModelManager.swift
//  binChecker
//
//  Created by Anton on 11.07.21.
//

import Foundation

class BankModelManager {
    
    let binService = BinCheckerService()
    
    func getInfo(for bank: Bank) -> String {
        return "💳Scheme: \(bank.scheme ?? "Unknown")\n🏦Bank: \(bank.bank?.name ?? "Unknown")\n🏷Type: \(bank.type ?? "Unknown")\n\(bank.country?.emoji ?? "🏴")Country: \(bank.country?.name ?? "Unknown")"
    }
}
