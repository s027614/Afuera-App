//
//  ListingDetail.swift
//  Contacts
//
//  Created by Lincoln Blouin (student LM) on 12/15/20.
//  Copyright © 2020 Swope, Thomas. All rights reserved.
//

import SwiftUI


struct ListingDetailUneditable: View {
    
    @State var listing = Listing(image: "joe mama", name: "joe mama", email: "joemama@gmail.com", experienceRequired: true, type: "pool care", hourlyRate: "$10", numberOfPeople: "3")
    @Binding var listings : [Listing]
    
    
    var body: some View {
        VStack {
            Image(listing.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .frame(width: 150, height: 150, alignment: .center)
            
            Form {
                Section {
                    Text("Name: \(listing.name)")
                        .font(.system(size: 30))
                    Text("Email: \(listing.email)")
                        .font(.system(size: 20))
                }
                Section {
                    if listing.experienceRequired == true {
                        Text("Experience Required")
                    }
                    else {
                        Text("Experience Not Required")
                    }
                    Text("Activity Type: \(listing.type)")
                }
                
                Section {
                    Text("Hourly Pay Rate: \(listing.hourlyRate)")
                    Text("Number of People Needed \(listing.numberOfPeople)")
                }
            }
            Button(action: {
                self.listings.append(self.listing)
            }) {
                Text("Accept Listing")
            }
        }
    }
}

struct ListingDetailUneditable_Previews: PreviewProvider {
    static var previews: some View {
        ListingDetailUneditable(listings: Binding.constant([Listing(image: "joe mama", name: "ben", email: "ben@ben.ben")]))
    }
}
