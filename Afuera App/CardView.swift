//
//  CardView.swift
//  Contacts
//
//  Created by Jacob Lowry (student LM) on 12/4/20.
//  Copyright © 2020 Swope, Thomas. All rights reserved.
//

import SwiftUI

//This struct is what makes the contacts so they can be displayed in the main view
struct CardView: View {
    
    //The binding variable contact
    @Binding var listing : Listing
    
    //the text and images for contacts are created here
    var body: some View {
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

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(listing: Binding.constant(Listing(image: "ben", name: "Ben", email: "@ben")))
    }
}
