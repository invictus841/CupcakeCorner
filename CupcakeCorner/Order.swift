//
//  Order.swift
//  CupcakeCorner
//
//  Created by Alexandre Talatinian on 25/07/2022.
//

import SwiftUI

@dynamicMemberLookup
class SharedOrder: ObservableObject {
    static let types = ["Vanilla", "Chocolate", "Strawberry", "Banana"]
    @Published var data = Order()
    
    
    subscript<T>(dynamicMember keyPath: KeyPath<Order, T>) -> T {
        data[keyPath: keyPath]
    }
    
    subscript<T>(dynamicMember keyPath: WritableKeyPath<Order, T>) -> T {
        get {
            data[keyPath: keyPath]
        }
        
        set {
            data[keyPath: keyPath] = newValue
        }
    }
    
}
        
struct Order: Codable {
    enum CodingKeys: CodingKey {
            case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
        }

         var type = 0
         var quantity = 3
        
         var specialRequestEnabled = false {
            didSet {
                if specialRequestEnabled == false {
                    extraFrosting = false
                    addSprinkles = false
                }
            }
        }
         var extraFrosting = false
         var addSprinkles = false
        
         var name = ""
         var streetAddress = ""
         var city = ""
         var zip = ""
        
         var hasValidAddress: Bool {
    //        let trimmedName = name.trimmingCharacters(in: .whitespaces)
    //        let trimmedStreetAddress = streetAddress.trimmingCharacters(in: .whitespaces)
    //        let trimmedCity = city.trimmingCharacters(in: .whitespaces)
    //        let trimmedZip = zip.trimmingCharacters(in: .whitespaces)
            
            
            if name.isReallyEmpty || streetAddress.isReallyEmpty || city.isReallyEmpty || zip.isReallyEmpty {
                return false
            }
            
            return true
        }
        
        var cost: Double {
            // $2 per cake
            var cost = Double(quantity) * 2
            
            // complicated cakes cost more
            cost += (Double(type) / 2)
            
            // $1/cake for extra frosting
            if extraFrosting {
                cost += Double(quantity)
            }
            
            // $0.50/ cake for sprinkles
            if addSprinkles {
                cost += Double(quantity) / 2
            }
            
            return cost
        }
}



