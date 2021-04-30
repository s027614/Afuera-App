//
//  ListingsView.swift
//  Contacts
//
//  Created by Swope, Thomas on 12/4/20.
//  Copyright © 2020 Swope, Thomas. All rights reserved.
//

import SwiftUI

struct AcceptedListingsView: View {
    
    @Binding var acceptedListings : [Listing]
    
    var body: some View {

        VStack {
            
            NavigationView{
               
                List{
                    
                    ForEach(0..<acceptedListings.count) { value in
                        CardView(listing: self.$acceptedListings[value], listings: self.$acceptedListings, acceptedListings: self.$acceptedListings)
                    }
                    
                    }
                }.navigationBarTitle("Your Listings")
               // .navigationBarItems(trailing: AddButton(listings: $listings))
        }
    }
}


struct AcceptedListingsView_Previews: PreviewProvider {
    static var previews: some View {
        AcceptedListingsView(acceptedListings: Binding.constant([Listing(image: "joe mama", name: "joe mama", email: "joemama@gmail.com")]))
    }
}
