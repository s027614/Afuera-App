////
////  ContentView.swift
////  Contacts
////
////  Created by Swope, Thomas on 12/4/20.
////  Copyright © 2020 Swope, Thomas. All rights reserved.
////
//
//import SwiftUI
//
//// ContentView struct
//// Adds several contacts to the UI and also adds the button to add a contact
//struct ListingsView: View {
//
//    @State var contacts : [Contact] =
//    [Contact(image: "ben", name: "Ben", email: "BenSmith@NewWaveComputers.com"),
//     Contact(image: "aslan", name: "Aslan", email: "Aslan@NewWaveComputers.com"),
//     Contact(image: "humphrey", name: "Humphrey", email: "Humphrey@NewWaveComputers.com"),
//     Contact(image: "joseph", name: "Joseph", email: "Joseph@NewWaveComputers.com"),
//     Contact(image: "kelly", name: "Kelly", email: "Kelly@NewWaveComputers.com"),
//     Contact(image: "michael", name: "Michael", email: "Michael@NewWaveComputers.com"),
//     Contact(image: "prince", name: "Prince", email: "Prince@NewWaveComputers.com"),].sorted {$0.name < $1.name}
//    @State var contact : Contact = Contact(image: "tyler", name: "Tyler", email: "Tyler@NewWaveComputers.com")
//
//    var body: some View {
//        ZStack{
//            // backgroud image
//            Image("background")
//                .opacity(0.1)
//
//            VStack(){
//
//                // adds a contact
//                CardView(contact: $contacts[0])
//
//
//                CardView(contact: $contacts[1])
//
//
//                CardView(contact: $contacts[2])
//
//
//                CardView(contact: $contacts[3])
//
//
//                CardView(contact: $contacts[4])
//
//
//                CardView(contact: $contacts[5])
//
//
//                CardView(contact: $contacts[6])
//
//                Spacer()
//                HStack{
//                    Spacer()
//                    // adds a button
//                    ButtonView(contacts: $contacts, contact: $contact)
//
//                }
//            }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
//                .padding(.top, 80)
//        }
//    }
//}
//
//struct ListingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListingsView()
//    }
//}
//
//
