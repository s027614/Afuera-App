//
//  ListingsView.swift
//  Contacts
//
//  Created by Swope, Thomas on 12/4/20.
//  Copyright © 2020 Swope, Thomas. All rights reserved.
//

import SwiftUI

struct AcceptedListingsView: View {
    
    @State var acceptedListings : [Listing] = [Listing(image: "joe mama", name: "joe mama", email: "joemama@gmail.com")]
    
    var body: some View {

        VStack {
            
            NavigationView{
                
                List{
                    
                    CardView(listing: self.$acceptedListings[0], listings: self.$acceptedListings)
                    CardView(listing: self.$acceptedListings[0], listings: self.$acceptedListings)
                    CardView(listing: self.$acceptedListings[0], listings: self.$acceptedListings)
                    CardView(listing: self.$acceptedListings[0], listings: self.$acceptedListings)
                    CardView(listing: self.$acceptedListings[0], listings: self.$acceptedListings)
                    
                    }
                }.navigationBarTitle("Your Listings")
               // .navigationBarItems(trailing: AddButton(listings: $listings))
        }
    }
}


struct AcceptedListingsView_Previews: PreviewProvider {
    static var previews: some View {
        AcceptedListingsView()
    }
}
