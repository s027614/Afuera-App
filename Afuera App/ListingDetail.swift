//
//  ListingDetail.swift
//  Contacts
//
//  Created by Lincoln Blouin (student LM) on 12/15/20.
//  Copyright © 2020 Swope, Thomas. All rights reserved.
//

import SwiftUI


struct ListingDetail: View {
    
    @Binding var listing : Listing
    @Binding var listings : [Listing]
    var contactTypeOptions : [String] = ["Friend","Coworker","Business"]
    
    
    var body: some View {
        VStack {
            Image(listing.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .frame(width: 300, height: 300, alignment: .center)
            
            Form {
                Section {
                    TextField("Username", text: $listing.name)
                        .font(.system(size: 30))
                    TextField("Email Address", text: $listing.email)
                        .font(.system(size: 20))
                }
                Section {
                    Toggle(isOn: $listing.favorite) {
                        Text("Favorite")
                    }
                    Picker(selection: $listing.type, label: Text("Contact Type")) {
                        ForEach(0..<contactTypeOptions.count) { i in
                            Text(self.contactTypeOptions[i])
                        }
                    }
                }
            }
            Button(action: {
                self.listings.append(self.listing)
            }) {
                Text("Add Button")
            }
        }
    }
}

struct ListingDetail_Previews: PreviewProvider {
    static var previews: some View {
        ListingDetail(listing: Binding.constant(Listing(image: "ben", name: "joe mama", email: "ben@ben.ben")), listings: Binding.constant([Listing(image: "joe mama", name: "ben", email: "ben@ben.ben")]))
    }
}
