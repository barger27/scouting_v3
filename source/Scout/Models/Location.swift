//
//  Location.swift
//  Scout
//
//  Created by Ryan Barger on 6/8/22.
//

import Foundation

struct Location : Identifiable, Equatable, Hashable, CustomStringConvertible {
    var address:String?
    var city:String?
    var state:String?
    var postalCode:String?
    
    var latitude:Double?
    var longitude:Double?
    var id:String {
        description
    }
    
    var description:String {
        if let city = city,
           let state = state {
            return "\(address != nil ? "\(address!), " : "")\(city), \(state)"
        }
        
        if let latitude = latitude,
           let longitude = longitude {
            return "(\(latitude), \(longitude))"
        }
        
        if let postalCode = postalCode {
            return postalCode
        }
        
        // Shouldn't be possible to execute this since all the inits require some of the info above
        return ""
    }
    
    
    init(postalCode:String) {
        self.postalCode = postalCode
    }
    
    
    init(city:String, state:String) {
        self.city = city
        self.state = state
    }
    
    
    init(address:String, city:String, state:String, postalCode:String? = nil) {
        self.address = address
        self.city = city
        self.state = state
        self.postalCode = postalCode
    }
    
    
    init(latitude:Double, longitude:Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    
    init(address:String, city:String, state:String, postalCode:String, latitude:Double, longitude:Double) {
        self.address = address
        self.city = city
        self.state = state
        self.postalCode = postalCode
        self.latitude = latitude
        self.longitude = longitude
    }
    
    
    func logicalEqual(other:Location) -> Bool {
        if let lhsAddress = address,
           let lhsCity = city,
           let lhsState = state,
           let rhsAddress = other.address,
           let rhsCity = other.city,
           let rhsState = other.state
        {
            return lhsAddress == rhsAddress &&
                   lhsCity == rhsCity &&
                   lhsState == rhsState
        }
        
        if let lhsCity = city,
           let lhsState = state,
           let rhsCity = other.city,
           let rhsState = other.state
        {
            return lhsCity == rhsCity &&
                   lhsState == rhsState
        }
        
        if let lhsPostal = postalCode,
           let rhsPostal = other.postalCode
        {
            return lhsPostal == rhsPostal
        }
        
        if let lhsLatitude = latitude,
           let lhsLongitude = longitude,
           let rhsLatitude = other.latitude,
           let rhsLongitude = other.longitude
        {
            let latDiff = abs(lhsLatitude - rhsLatitude)
            let longDiff = abs(lhsLongitude - rhsLongitude)
            
            return latDiff < 0.33 && longDiff < 0.33
        }
        
        return false
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
    static func ==(lhs:Location, rhs:Location) -> Bool {
        return lhs.id == rhs.id
    }
}
