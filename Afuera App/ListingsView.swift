//
//  ListingsView.swift
//  Contacts
//
//  Created by Ginzburg, Elliot on 4/4/21.
//  Copyright © 2020 Ginzburg, Elliot. All rights reserved.
//

import SwiftUI

struct ListingsView: View {
    
    
    @Binding var listings : [Listing]
    @Binding var acceptedListings : [Listing]
    @Binding var moneyEarned : Int
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Text("<— Back")
        }
        }
    }
    var body: some View {
        
        VStack {
              Image("brown-1").resizable().aspectRatio(contentMode: .fit).padding(.all, 7.0)
            NavigationView{
                
                List{
                    
                    AddButton(listings: $listings)
                    
                    ForEach(0..<listings.count) { value in
                        CardView(listing: self.$listings[value], listings: self.$listings, acceptedListings: self.$acceptedListings, moneyEarned: self.$moneyEarned)
                    }
                }
                    
                }.navigationBarTitle("Listings").navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: btnBack)
                    .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in
                        if(value.startLocation.x < 20 &&
                            value.translation.width > 100) {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    })
                        // .navigationBarItems(trailing: AddButton(listings: $listings))
                        
                        
                )}
        }
    }


struct ListingsView_Previews: PreviewProvider {
    static var previews: some View {
        ListingsView(listings: Binding.constant([
        Listing(image: "yard work", name: "John Smith", email: "jsmith@gmail.com", address: "407 Fig Street", zipcode: "19003", experienceRequired: false, type: "Yard Work", hourlyRate: "25", numberOfPeople: "1", isAccepted: false, isComplete: false),
           Listing(image: "shoveling", name: "Jane Doe", email: "janedoe@icloud.com", address: "40 Apple Street", zipcode: "12345", experienceRequired: false, type: "Shoveling", hourlyRate: "20", numberOfPeople: "2", isAccepted: false, isComplete: false),
           Listing(image: "pool care", name: "Tomé Brady", email: "tom@tb12.com", address: "20 Plum Street", zipcode: "13047", experienceRequired: true, type: "Pool Care", hourlyRate: "100", numberOfPeople: "1", isAccepted: false, isComplete: false),
           Listing(image: "landscaping", name: "Jose John", email: "jj@harvard.edu", address: "4094 Pear Street", zipcode: "02378", experienceRequired: true, type: "Landscaping", hourlyRate: "40", numberOfPeople: "3+", isAccepted: false, isComplete: false),
           Listing(image: "christmas lights", name: "Kris Kring", email: "sclaus@thenorthpole.com", address: "12 Cherry Street", zipcode: "00001", experienceRequired: true, type: "Christmas Lights", hourlyRate: "42", numberOfPeople: "2", isAccepted: false, isComplete: false),
           Listing(image: "landscaping", name: "Lily Hobbs", email: "lilyhobbs@icloud.com", address: "423 Pop Street", zipcode: "19096", experienceRequired: true, type: "Landscaping", hourlyRate: "35", numberOfPeople: "3+", isAccepted: false, isComplete: false),
           Listing(image: "pool care", name: "Luka Donci", email: "luka@dallasmavs.com", address: "665 Yum Street", zipcode: "59086", experienceRequired: true, type: "Pool Care", hourlyRate: "85", numberOfPeople: "2", isAccepted: false, isComplete: false),
           Listing(image: "yard work", name: "Cecilia Bon", email: "CeceB@newwave.com", address: "33 Besties Street", zipcode: "32089", experienceRequired: false, type: "Yard Work", hourlyRate: "24", numberOfPeople: "2", isAccepted: false, isComplete: false)
            ].sorted(by: {$0.name < $1.name})), acceptedListings: Binding.constant([Listing(image: "user", name: "John Doe", email: "jonnydoe@gmail.com")]), moneyEarned: Binding.constant(1000))
    }
}
