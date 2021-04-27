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
    var experienceRequired : Bool
    var type : String // pool, lawn, shoveling, etc.
    var hourlyRate : String
    var numberOfPeople : String
    var isAccepted : Bool



    init(image : String = "user", name : String = "name", email : String = "email", experienceRequired : Bool  = false, type : String = "type", hourlyRate : String = "pay rate", numberOfPeople : String = "# of people", isAccepted : Bool = false){
        self.image = image
        self.name = name
        self.email = email
        self.experienceRequired = experienceRequired
        self.type = type
        self.hourlyRate = hourlyRate
        self.numberOfPeople = numberOfPeople
        self.isAccepted = isAccepted
    }
}
