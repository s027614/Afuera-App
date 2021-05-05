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
     @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero

    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Text("")
        }
        }
    }
    
    var body: some View {

        VStack {
            
            NavigationView{
               
                List{
                    
                    ForEach(0..<acceptedListings.count) { value in
                        CardView(listing: self.$acceptedListings[value], listings: self.$acceptedListings, acceptedListings: self.$acceptedListings)
                    }
                    }
                }.navigationBarTitle("Your Listings").navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: btnBack).gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in
                        if(value.startLocation.x < 20 &&
                            value.translation.width > 100) {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    })
                        // .navigationBarItems(trailing: AddButton(listings: $listings))
                        
                        
                )
               // .navigationBarItems(trailing: AddButton(listings: $listings))
        }
    }
}


struct AcceptedListingsView_Previews: PreviewProvider {
    static var previews: some View {
        AcceptedListingsView(acceptedListings: Binding.constant([Listing(image: "user", name: "John Doe", email: "jonnydoe@gmail.com")]))
    }
}
