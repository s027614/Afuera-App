//
//  ContactsView.swift
//  Contacts
//
//  Created by Jacob Lowry (student LM) on 12/10/20.
//  Copyright © 2020 Swope, Thomas. All rights reserved.
//

import SwiftUI

struct ListingListView: View {
    
    @Binding var listings : [Listing]
    
    var body: some View {
        List(listings){ listing in
            
            HStack{
                
                Image(listing.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100, alignment: .center)
                    .clipped()
                VStack(alignment: .leading){
                    Text(listing.name).font(.system(size: 30))
                        .foregroundColor(.orange)
                    Text(listing.email).font(.system(size: CGFloat(250/listing.email.count)))
                }
            }.background(Color.white.opacity(0.7)).cornerRadius(20).cornerRadius(20)
                .padding(.horizontal, 10)
        }
    }
}

struct ListingListView_Previews: PreviewProvider {
    static var previews: some View {
        ListingListView(listings:
            Binding.constant([Listing(image: "joe mama", name: "Ben", email: "BenSmith@NewWaveComputers.com"),
             Listing(image: "joe mama", name: "Aslan", email: "Aslan@NewWaveComputers.com"),
             Listing(image: "joe mama", name: "Humphrey", email: "Humphrey@NewWaveComputers.com"),
             Listing(image: "joe mama", name: "Joseph", email: "Joseph@NewWaveComputers.com"),
             Listing(image: "joe mama", name: "Kelly", email: "Kelly@NewWaveComputers.com"),
             Listing(image: "joe mama", name: "Michael", email: "Michael@NewWaveComputers.com"),
             Listing(image: "joe mama", name: "Prince", email: "Prince@NewWaveComputers.com"),
             Listing(image: "joe mama", name: "Tyler", email: "Tyler@NewWaveComputers.com")
                ].sorted(by: {$0.name < $1.name})))
        
    }
}

