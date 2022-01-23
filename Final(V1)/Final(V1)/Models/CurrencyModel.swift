//
//  CurrencyModel.swift
//  Final(V1)
//
//  Created by Ahmad Hasan on 12/12/21.
//

import Foundation

struct CurrencyModel {
    let rate: Double
    
    var currencyString: String {
        return String(format: "%.5f", rate)
    }
}
