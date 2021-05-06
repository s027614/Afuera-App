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
    @Binding var moneyEarned : Int
    
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
                    Text("Address: \(self.listing.address)")
                                           .font(.system(size: 20))
                    Text("Zipcode: \(self.listing.zipcode)")
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
                    self.acceptedListings.append(self.listing)
                    self.listing.isAccepted = true
                    self.presentationMode.wrappedValue.dismiss()
                    
                }) {
                    Text("Accept Listing")
                }
            }
            else if self.listing.isAccepted == true && self.listing.isComplete == false{
                Button(action: {
                     self.listing.isComplete = true
                    self.moneyEarned += Int(self.listing.hourlyRate)!
                     self.presentationMode.wrappedValue.dismiss()
                     
                 }) {
                     Text("Complete Job")
                 }
            }
        }
    }
}

struct ListingDetailUneditable_Previews: PreviewProvider {
    static var previews: some View {
        ListingDetailUneditable(listing: Binding.constant(Listing(image: "joe mama", name: "ben", email: "ben@ben.ben")), listings: Binding.constant([
       Listing(image: "yard work", name: "John Smith", email: "jsmith@gmail.com", address: "407 Fig Street", zipcode: "19003", experienceRequired: false, type: "Yard Work", hourlyRate: "25", numberOfPeople: "1", isAccepted: false, isComplete: false),
          Listing(image: "shoveling", name: "Jane Doe", email: "janedoe@icloud.com", address: "40 Apple Street", zipcode: "12345", experienceRequired: false, type: "Shoveling", hourlyRate: "20", numberOfPeople: "2", isAccepted: false, isComplete: false),
          Listing(image: "pool care", name: "Tomé Brady", email: "tom@tb12.com", address: "20 Plum Street", zipcode: "13047", experienceRequired: true, type: "Pool Care", hourlyRate: "100", numberOfPeople: "1", isAccepted: false, isComplete: false),
          Listing(image: "landscaping", name: "Jose John", email: "jj@harvard.edu", address: "4094 Pear Street", zipcode: "02378", experienceRequired: true, type: "Landscaping", hourlyRate: "40", numberOfPeople: "3+", isAccepted: false, isComplete: false),
          Listing(image: "christmas lights", name: "Kris Kring", email: "sclaus@thenorthpole.com", address: "12 Cherry Street", zipcode: "00001", experienceRequired: true, type: "Christmas Lights", hourlyRate: "42", numberOfPeople: "2", isAccepted: false, isComplete: false),
          Listing(image: "landscaping", name: "Lily Hobbs", email: "lilyhobbs@icloud.com", address: "423 Pop Street", zipcode: "19096", experienceRequired: true, type: "Landscaping", hourlyRate: "35", numberOfPeople: "3+", isAccepted: false, isComplete: false),
          Listing(image: "pool care", name: "Luka Donci", email: "luka@dallasmavs.com", address: "665 Yum Street", zipcode: "59086", experienceRequired: true, type: "Pool Care", hourlyRate: "85", numberOfPeople: "2", isAccepted: false, isComplete: false),
          Listing(image: "yard work", name: "Cecilia Bon", email: "CeceB@newwave.com", address: "33 Besties Street", zipcode: "32089", experienceRequired: false, type: "Yard Work", hourlyRate: "24", numberOfPeople: "2", isAccepted: false, isComplete: false) ]),
                                acceptedListings: Binding.constant([Listing(image: "joe mama", name: "joe mama", email: "joemama@gmail.com")]), moneyEarned: Binding.constant(1000))
    }
}
