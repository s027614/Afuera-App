//
//  ListingDetail.swift
//  Contacts
//
//  Created by Ginzburg, Elliot on 4/12/21.
//  Copyright © 2020 Ginzburg, Elliot. All rights reserved.
//

import SwiftUI


struct ListingDetailUneditable: View {
    
    @Binding var listing : Listing
    @Binding var listings : [Listing]
    @Binding var acceptedListings : [Listing]
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        VStack {
           if self.listing.type == "Yard Work"{
               
           Image("yard work")
               .resizable()
               .aspectRatio(contentMode: .fill)
               .clipShape(Circle())
               .frame(width: 150, height: 150, alignment: .center)
           }
           
           else if self.listing.type == "Shoveling"{
               
           Image("shoveling")
               .resizable()
               .aspectRatio(contentMode: .fill)
               .clipShape(Circle())
               .frame(width: 150, height: 150, alignment: .center)
           }
           
           else if self.listing.type == "Pool Care"{
               
           Image("pool care")
               .resizable()
               .aspectRatio(contentMode: .fill)
               .clipShape(Circle())
               .frame(width: 150, height: 150, alignment: .center)
           }
            
            else if self.listing.type == "Christmas Lights"{
                
            Image("christmas lights")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .frame(width: 150, height: 150, alignment: .center)
            }
            
            else if self.listing.type == "Landscaping"{
                
            Image("landscaping")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .frame(width: 150, height: 150, alignment: .center)
            }
            Form {
                Section {
                    Text("Name: \(self.listing.name)")
                        .font(.system(size: 30))
                    Text("Email: \(self.listing.email)")
                        .font(.system(size: 20))
                }
                Section {
                    if self.listing.experienceRequired == true {
                        Text("Experience Required")
                    }
                    else {
                        Text("Experience Not Required")
                    }
                    Text("Activity Type: \(self.listing.type)")
                }
                
                Section {
                    Text("Hourly Pay Rate: \(self.listing.hourlyRate)")
                    Text("Number of People Needed: \(self.listing.numberOfPeople)")
                }
            }
            
            if self.listing.isAccepted == false {
                Button(action: {
               //     self.listings.remove(at: 1)
                    self.acceptedListings.append(self.listing)
                    self.listing.isAccepted = true
                    self.presentationMode.wrappedValue.dismiss()
                    
                }) {
                    Text("Accept Listing")
                }
            }
        }
    }
}

struct ListingDetailUneditable_Previews: PreviewProvider {
    static var previews: some View {
        ListingDetailUneditable(listing: Binding.constant(Listing(image: "joe mama", name: "ben", email: "ben@ben.ben")), listings: Binding.constant([Listing(image: "yard work", name: "John Smith", email: "jsmith@gmail.com", experienceRequired: false, type: "Yard Work", hourlyRate: "$25", numberOfPeople: "1", isAccepted: false),
        Listing(image: "shoveling", name: "Jane Doe", email: "janedoe@icloud.com", experienceRequired: false, type: "Shoveling", hourlyRate: "$20", numberOfPeople: "2", isAccepted: false),
        Listing(image: "pool care", name: "Thomas Brady", email: "tom@TB12.com", experienceRequired: true, type: "Pool Care", hourlyRate: "$100", numberOfPeople: "1", isAccepted: false),
        Listing(image: "landscaping", name: "Joseph Johnson", email: "JJ@harvard.edu", experienceRequired: true, type: "Landscaping", hourlyRate: "$40", numberOfPeople: "3+", isAccepted: false),Listing(image: "christmas lights", name: "Kris Kringle", email: "SClaus@thenorthpole.com", experienceRequired: true, type: "Yard Christmas Lights", hourlyRate: "$42", numberOfPeople: "2", isAccepted: false)]), acceptedListings: Binding.constant([Listing(image: "joe mama", name: "joe mama", email: "joemama@gmail.com")]))
    }
}
