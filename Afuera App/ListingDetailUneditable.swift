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
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        VStack {
            Image(listing.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .frame(width: 150, height: 150, alignment: .center)
            
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
                    self.listings.append(self.listing)
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
        ListingDetailUneditable(listing: Binding.constant(Listing(image: "joe mama", name: "ben", email: "ben@ben.ben")), listings: Binding.constant([Listing(image: "joe mama", name: "ben", email: "ben@ben.ben")]))
    }
}
