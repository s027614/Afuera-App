//
//  AddButton.swift
//  Contacts
//
//  Created by Swope, Thomas on 12/9/20.
//  Copyright © 2020 Swope, Thomas. All rights reserved.
//

import SwiftUI

struct ListingsButton: View {
    
    @Binding var listings : [Listing]
    @Binding var acceptedListings : [Listing]
    @Binding var moneyEarned : Int
    
    var body: some View {
        NavigationLink(destination: ListingsView(listings: $listings, acceptedListings: $acceptedListings, moneyEarned: self.$moneyEarned)) {
            Text("Listings Page")
            .frame(width: 150)
            .padding(.vertical, 15)
            .background(Color.green)
            .cornerRadius(8)
            .foregroundColor(.white)
        }
    }
}

struct ListingsButton_Previews: PreviewProvider {
    static var previews: some View {
        ListingsButton(listings: Binding.constant([Listing(image: "joe mama", name: "Ben", email: "BenSmith@NewWaveComputers.com"),
        Listing(image: "joe mama", name: "Aslan", email: "BenSmith@NewWaveComputers.com"),
        Listing(image: "joe mama", name: "Humphrey", email: "BenSmith@NewWaveComputers.com"),
        Listing(image: "joe mama", name: "Joseph", email: "BenSmith@NewWaveComputers.com"),
        Listing(image: "joe mama", name: "Kelly", email: "BenSmith@NewWaveComputers.com"),
        Listing(image: "joe mama", name: "Michael", email: "BenSmith@NewWaveComputers.com"),
        Listing(image: "joe mama", name: "Prince", email: "BenSmith@NewWaveComputers.com"),
        Listing(image: "joe mama", name: "Tyler", email: "BenSmith@NewWaveComputers.com")
            ].sorted(by: {$0.name < $1.name})), acceptedListings: Binding.constant([Listing(image: "joe mama", name: "joe mama", email: "joemama@gmail.com")]), moneyEarned: Binding.constant(1000))
    }
}
