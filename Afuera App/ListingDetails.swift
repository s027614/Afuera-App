////
////  ContactDetail.swift
////  Contacts
////
////  Created by Lincoln Blouin (student LM) on 12/21/20.
////  Copyright © 2020 Swope, Thomas. All rights reserved.
////
//
//import SwiftUI
//
//struct ListingDetails: View {
//
//    @Binding var contact : Contact
//
//    var body: some View {
//        VStack {
//            Image(contact.image)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .clipShape(Circle())
//                .frame(width: 300, height: 300, alignment: .center)
//
//            Form{
//                Section{
//                    TextField ("Username", text: $contact.name)
//                        .font(.system(size: 30))
//                    TextField ("Username", text: $contact.email)
//                        .font(.system(size: 20))
//                }
//                Section{
//    Toggle(isOn: $contact.favorite) {
//        Text("Favorite")
//    }
//
//                }
//            }
//        }
//    }
//}
//
//struct ListingDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        ListingDetails(contact: Binding.constant(Contact(image: "ben", name: "Ben", email: "ben@ben.ben")))
//    }
//}
