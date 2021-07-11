//
//  Bank.swift
//  binChecker
//
//  Created by Anton on 11.07.21.
//

import Foundation

struct Bank: Decodable {
    let number: Number?
    let scheme, type, brand: String?
    let prepaid: Bool?
    let country: Country?
    let bank: BankClass?
}

struct BankClass: Codable {
    let name, url, phone, city: String?
}

struct Country: Codable {
    let numeric, alpha2, name, emoji: String?
    let currency: String?
    let latitude, longitude: Int?
}

struct Number: Codable {
    let length: Int?
    let luhn: Bool?
}

