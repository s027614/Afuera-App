//
//  CardView.swift
//  Contacts
//
//  Created by Swope, Thomas on 12/9/20.
//  Copyright © 2020 Swope, Thomas. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    @Binding var listing : Listing
    @Binding var listings : [Listing]
    @Binding var acceptedListings : [Listing]
    
    var body: some View {
        HStack{
            Image(listing.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100, alignment: .center)
                .clipped()

            NavigationLink(destination: ListingDetailUneditable(listing: self.$listing, listings : self.$listings, acceptedListings: self.$acceptedListings)) {
                VStack(alignment: .leading){
                    Text("\(listing.type) for \(listing.name)").font(.system(size: 25))
                        .foregroundColor(.orange)
                        .minimumScaleFactor(0.0001)
                        .lineLimit(1)
                    Text(listing.email).font(.system(size: 30))
                        .minimumScaleFactor(0.0001)
                        .lineLimit(1)
                }
            }
        }.background(Color.white.opacity(0.7)).cornerRadius(20).cornerRadius(20)
            .padding(.horizontal, 10)
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(listing: Binding.constant(Listing(image: "joe mama", name: "Ben", email: "BenSmith@NewWaveComputers.com")), listings: Binding.constant([Listing(image: "ben", name: "Ben", email: "BenSmith@NewWaveComputers.com")]), acceptedListings: Binding.constant([Listing(image: "joe mama", name: "joe mama", email: "joemama@gmail.com")]))
    }
}
