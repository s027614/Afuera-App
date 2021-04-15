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
    var favorite : Bool
    var type : String // friend, co-worker, business



    init(image : String = "user", name : String = "name", email : String = "email", favorite : Bool  = false, type : String = "friend"){
        self.image = image
        self.name = name
        self.email = email
        self.favorite = favorite
        self.type = type
    }
}
