//
//  CryptoData.swift
//  Final(V1)
//
//  Created by Ahmad Hasan on 12/14/21.
//

import Foundation

struct CryptoData: Codable {
    
    let data: Data1
    
}

struct Data1: Codable {
    let market_data: Market_data
    let all_time_high: All_Time_High
}

struct Market_data: Codable {
    let price_usd: Double
    let ohlcv_last_24_hour: Ohlcv_Last_24_Hour
}

struct All_Time_High: Codable {
    let price: Double
}

struct Ohlcv_Last_24_Hour: Codable {
    let open: Double
    let high: Double
    let low: Double
    let close: Double
    let volume: Double
}
