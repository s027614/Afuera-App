//
//  ListingsView.swift
//  Contacts
//
//  Created by Swope, Thomas on 12/4/20.
//  Copyright © 2020 Swope, Thomas. All rights reserved.
//

import SwiftUI

struct ListingsView: View {
    
    
    @Binding var listings : [Listing]
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
              Image("brown-1").resizable().aspectRatio(contentMode: .fit).padding(.all, 7.0)
            NavigationView{
                
                List{
                    
                    AddButton(listings: $listings)
                    
                    ForEach(0..<listings.count) { value in
                        CardView(listing: self.$listings[value], listings: self.$listings, acceptedListings: self.$acceptedListings)
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
        ListingsView(listings: Binding.constant([Listing(image: "yard work", name: "John Smith", email: "jsmith@gmail.com", experienceRequired: false, type: "Yard Work", hourlyRate: "$25", numberOfPeople: "1", isAccepted: false),
        Listing(image: "shoveling", name: "Jane Doe", email: "janedoe@icloud.com", experienceRequired: false, type: "Shoveling", hourlyRate: "$20", numberOfPeople: "2", isAccepted: false),
        Listing(image: "pool care", name: "Thomas Brady", email: "tom@TB12.com", experienceRequired: true, type: "Pool Care", hourlyRate: "$100", numberOfPeople: "1", isAccepted: false),
        Listing(image: "landscaping", name: "Joseph Johnson", email: "JJ@harvard.edu", experienceRequired: true, type: "Landscaping", hourlyRate: "$40", numberOfPeople: "3+", isAccepted: false),Listing(image: "christmas lights", name: "Kris Kringle", email: "SClaus@thenorthpole.com", experienceRequired: true, type: "Yard Christmas Lights", hourlyRate: "$42", numberOfPeople: "2", isAccepted: false),
        Listing(image: "landscaping", name: "Lily Hobbs", email: "lilyhobbs@icloud.com", experienceRequired: true, type: "Landscaping", hourlyRate: "$35", numberOfPeople: "3+", isAccepted: false),
        Listing(image: "pool care", name: "Luka Doncic", email: "luka@dallasmavs.com", experienceRequired: true, type: "Pool Care", hourlyRate: "$85", numberOfPeople: "2", isAccepted: false),
        Listing(image: "yard work", name: "Cecilia Botwright", email: "CeceB@newwave.com", experienceRequired: false, type: "Yard Work", hourlyRate: "$24", numberOfPeople: "2", isAccepted: false)
            ].sorted(by: {$0.name < $1.name})), acceptedListings: Binding.constant([Listing(image: "joe mama", name: "joe mama", email: "joemama@gmail.com")]))
    }
}
