//
//  CryptoModel.swift
//  Final(V1)
//
//  Created by Ahmad Hasan on 12/14/21.
//

import Foundation

struct CryptoModel {
    
    let price: Double
    
    let open: Double
    let high: Double
    let low: Double
    let close: Double
    let volume: Double
    
    let allTime: Double
    
    var cryptoString: String {
        return String(format: "%.6f", price)
    }
    
    var openString: String {
        return String(format: "%.6f", open)
    }
    var highString: String {
        return String(format: "%.6f", high)
    }
    var lowString: String {
        return String(format: "%.6f", low)
    }
    var closeString: String {
        return String(format: "%.6f", close)
    }
    var volumeString: String {
        return String(format: "%.6f", volume)
    }
    
    var allTimeString: String {
        return String(format: "%.6f", allTime)
    }
}
