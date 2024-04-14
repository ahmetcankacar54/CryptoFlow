//
//  Double.swift
//  CryptoFlow
//
//  Created by Ahmet Kaçar on 15.04.2024.
//

import Foundation

extension Double {
    
    
    /// Converts a Double into Currency with 2 decimals places.
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// Convert 12.3456 to $12.34
    /// Convert 0.123456 to $0.12
    /// ```
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current // <- Default Value
//        formatter.currencyCode = "usd" // <- Change currency
//        formatter.currencySymbol = "$"// <- Change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    
    /// Converts a Double into Currency as a String with 2 decimals places.
    /// ```
    /// Convert 1234.56 to "$1,234.56"
    /// Convert 12.3456 to "$12.34"
    /// Convert 0.123456 to "$0.12"
    /// ```
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    /// Converts a Double into Currency with 2-6 decimal places.
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// Convert 12.3456 to $12.3456
    /// Convert 0.123456 to $0.123456
    /// ```
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current // <- Default Value
//        formatter.currencyCode = "usd" // <- Change currency
//        formatter.currencySymbol = "$"// <- Change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    
    /// Converts a Double into Currency as a String with 2-6 decimal places.
    /// ```
    /// Convert 1234.56 to "$1,234.56"
    /// Convert 12.3456 to "$12.3456"
    /// Convert 0.123456 to "$0.123456"
    /// ```
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    /// Converts a Double into String  with 2 decimal places.
    /// ```
    /// Convert 1234.56 to "$1,234.56"
    /// Convert 12.3456 to "$12.34"
    /// Convert 0.123456 to "$0.12"
    /// ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    
    /// Converts a Double into String  representation with percent symbol.
    /// ```
    /// Convert 0.123456 to "0.12%"
    /// ```
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
}
