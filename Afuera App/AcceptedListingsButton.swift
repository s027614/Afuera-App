//
//  AddButton.swift
//  Contacts
//
//  Created by Swope, Thomas on 12/9/20.
//  Copyright © 2020 Swope, Thomas. All rights reserved.
//

import SwiftUI

struct AcceptedListingsButton: View {
    
    @Binding var acceptedListings : [Listing]
    @Binding var moneyEarned : Int
    
    var body: some View {
        NavigationLink(destination: AcceptedListingsView(acceptedListings: $acceptedListings, moneyEarned: self.$moneyEarned)) {
            Text("Accepted Listings")
            .frame(width: 180)
            .padding(.vertical, 15)
            .background(Color.green)
            .cornerRadius(8)
            .foregroundColor(.white)
        }
    }
}

struct AcceptedListingsButton_Previews: PreviewProvider {
    static var previews: some View {
        AcceptedListingsButton(acceptedListings: Binding.constant([Listing(image: "joe mama", name: "joe mama", email: "joemama@gmail.com")]), moneyEarned: Binding.constant(1000))
    }
}
