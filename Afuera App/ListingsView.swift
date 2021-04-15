//
//  ContentView.swift
//  Contacts
//
//  Created by Swope, Thomas on 12/4/20.
//  Copyright © 2020 Swope, Thomas. All rights reserved.
//

import SwiftUI

struct ListingsView: View {
    
    @State var listings : [Listing] =
        [Listing(image: "joe mama", name: "Ben", email: "BenSmith@NewWaveComputers.com"),
         Listing(image: "joe mama", name: "Aslan", email: "BenSmith@NewWaveComputers.com"),
         Listing(image: "joe mama", name: "Humphrey", email: "BenSmith@NewWaveComputers.com"),
         Listing(image: "joe mama", name: "Joseph", email: "BenSmith@NewWaveComputers.com"),
         Listing(image: "joe mama", name: "Kelly", email: "BenSmith@NewWaveComputers.com"),
         Listing(image: "joe mama", name: "Michael", email: "BenSmith@NewWaveComputers.com"),
         Listing(image: "joe mama", name: "Prince", email: "BenSmith@NewWaveComputers.com"),
         Listing(image: "joe mama", name: "Tyler", email: "BenSmith@NewWaveComputers.com")
            ].sorted(by: {$0.name < $1.name})
    
    var body: some View {

            NavigationView{
                
                List{
                    CardView(listing: self.$listings[1], listings: self.$listings)
                     CardView(listing: self.$listings[1], listings: self.$listings)
                     CardView(listing: self.$listings[1], listings: self.$listings)
                     CardView(listing: self.$listings[1], listings: self.$listings)
                     CardView(listing: self.$listings[1], listings: self.$listings)
                     CardView(listing: self.$listings[1], listings: self.$listings)
                     CardView(listing: self.$listings[1], listings: self.$listings)
                    }
                }.navigationBarTitle("Listings")
                .navigationBarItems(trailing: AddButton(listings: $listings))
        }
}


struct ListingsView_Previews: PreviewProvider {
    static var previews: some View {
        ListingsView()
    }
}
