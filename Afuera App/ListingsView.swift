//
//  ContentView.swift
//  Contacts
//
//  Created by Swope, Thomas on 12/4/20.
//  Copyright © 2020 Swope, Thomas. All rights reserved.
//

import SwiftUI

//This struct is the main view which displays all of thext and images for each contact
struct ListingsView: View {
    
    //THe array of contacts
    @State var listings : [Listing] =
        [Listing(image: "joe mama", name: "Ben", email: "BenSmith@NewWaveComputers.com"),
         Listing(image: "joe mama", name: "Aslan", email: "Aslan@NewWaveComputers.com"),
         Listing(image: "joe mama", name: "Humphrey", email: "Humphrey@NewWaveComputers.com"),
         Listing(image: "joe mama", name: "Joseph", email: "Joseph@NewWaveComputers.com"),
         Listing(image: "joe mama", name: "Kelly", email: "Kelly@NewWaveComputers.com"),
         Listing(image: "joe mama", name: "Michael", email: "Michael@NewWaveComputers.com"),
         Listing(image: "joe mama", name: "Prince", email: "Prince@NewWaveComputers.com"),
         Listing(image: "joe mama", name: "Tyler", email: "Tyler@NewWaveComputers.com")
            ].sorted(by: {$0.name < $1.name})
    
    
    var body: some View {
        ZStack{
            Image("background")
                .opacity(0.1)
            
            VStack(){
                
                //All of the contacts are displayed using binding from the CardView
                ListingListView(listings: $listings)
                HStack(){
                    Spacer()
                    
                    //Displays the add button
                    AddButtonView(listings: $listings)
                    
                }
                Spacer()

            }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            
            
            
            
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .padding(.top, 80)
    }
}


struct ListingsView_Previews: PreviewProvider {
    static var previews: some View {
        ListingsView()
    }
}
