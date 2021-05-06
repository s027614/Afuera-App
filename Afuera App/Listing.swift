//
//  Listing.swift
//  Afuera App
//
//  Created by Lincoln Blouin (student LM) on 4/13/21.
//  Copyright © 2021 Jacob Lowry (student LM). All rights reserved.
//

import Foundation
class Listing : Identifiable{
    var id = UUID()
    var image : String
    var name : String
    var email : String
    var address : String
    var zipcode : String
    var experienceRequired : Bool
    var type : String // pool, lawn, shoveling, etc.
    var hourlyRate : String
    var numberOfPeople : String
    var isAccepted : Bool
    var isComplete : Bool


    init(image : String = "user", name : String = "Name", email : String = "Email", address: String = "Address", zipcode: String = "Zipcode",experienceRequired : Bool  = false, type : String = "type", hourlyRate : String = "", numberOfPeople : String = "# of people", isAccepted : Bool = false, isComplete : Bool = false){
        self.image = image
        self.name = name
        self.email = email
        self.address = address
        self.zipcode = zipcode
        self.experienceRequired = experienceRequired
        self.type = type
        self.hourlyRate = hourlyRate
        self.numberOfPeople = numberOfPeople
        self.isAccepted = isAccepted
        self.isComplete = isComplete
    }
}
