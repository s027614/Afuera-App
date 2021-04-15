//
//  AddButton.swift
//  Contacts
//
//  Created by Swope, Thomas on 12/9/20.
//  Copyright © 2020 Swope, Thomas. All rights reserved.
//

import SwiftUI

struct AddButton: View {
    
    @Binding var listings : [Listing]
    
    var body: some View {
        NavigationLink(destination: ListingDetail(listing: Binding.constant(Listing()), listings: $listings)) {
            Image(systemName: "plus")
            .foregroundColor(.black)
            Text("Add A Listing")
            .foregroundColor(.black)
        }
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton(listings: Binding.constant([Listing(image: "joe mama", name: "Ben", email: "BenSmith@NewWaveComputers.com"),
        Listing(image: "joe mama", name: "Aslan", email: "BenSmith@NewWaveComputers.com"),
        Listing(image: "joe mama", name: "Humphrey", email: "BenSmith@NewWaveComputers.com"),
        Listing(image: "joe mama", name: "Joseph", email: "BenSmith@NewWaveComputers.com"),
        Listing(image: "joe mama", name: "Kelly", email: "BenSmith@NewWaveComputers.com"),
        Listing(image: "joe mama", name: "Michael", email: "BenSmith@NewWaveComputers.com"),
        Listing(image: "joe mama", name: "Prince", email: "BenSmith@NewWaveComputers.com"),
        Listing(image: "joe mama", name: "Tyler", email: "BenSmith@NewWaveComputers.com")
           ].sorted(by: {$0.name < $1.name})))
    }
}
