//
//  ListingDetail.swift
//  Contacts
//
//  Created by Lincoln Blouin (student LM) on 12/15/20.
//  Copyright © 2020 Swope, Thomas. All rights reserved.
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
        ListingDetailUneditable(listing: Binding.constant(Listing(image: "joe mama", name: "ben", email: "ben@ben.ben")), listings: Binding.constant([
        Listing(image: "yard work", name: "John Smith", email: "jsmith@gmail.com", zipcode: "19003", experienceRequired: false, type: "Yard Work", hourlyRate: "$25", numberOfPeople: "1", isAccepted: false),
        Listing(image: "shoveling", name: "Jane Doe", email: "janedoe@icloud.com", zipcode: "12345", experienceRequired: false, type: "Shoveling", hourlyRate: "$20", numberOfPeople: "2", isAccepted: false),
        Listing(image: "pool care", name: "Thomas Brady", email: "tom@TB12.com", zipcode: "13047", experienceRequired: true, type: "Pool Care", hourlyRate: "$100", numberOfPeople: "1", isAccepted: false),
        Listing(image: "landscaping", name: "Joseph Johnson", email: "JJ@harvard.edu", zipcode: "02378", experienceRequired: true, type: "Landscaping", hourlyRate: "$40", numberOfPeople: "3+", isAccepted: false),
        Listing(image: "christmas lights", name: "Kris Kringle", email: "SClaus@thenorthpole.com", zipcode: "00001", experienceRequired: true, type: "Yard Christmas Lights", hourlyRate: "$42", numberOfPeople: "2", isAccepted: false),
        Listing(image: "landscaping", name: "Lily Hobbs", email: "lilyhobbs@icloud.com", zipcode: "19096", experienceRequired: true, type: "Landscaping", hourlyRate: "$35", numberOfPeople: "3+", isAccepted: false),
        Listing(image: "pool care", name: "Luka Doncic", email: "luka@dallasmavs.com", zipcode: "59086", experienceRequired: true, type: "Pool Care", hourlyRate: "$85", numberOfPeople: "2", isAccepted: false),
        Listing(image: "yard work", name: "Cecilia Botwright", email: "CeceB@newwave.com", zipcode: "32089", experienceRequired: false, type: "Yard Work", hourlyRate: "$24", numberOfPeople: "2", isAccepted: false)]), acceptedListings: Binding.constant([Listing(image: "joe mama", name: "joe mama", email: "joemama@gmail.com")]))
    }
}
