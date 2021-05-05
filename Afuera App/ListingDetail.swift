//
//  ListingDetail.swift
//  Contacts
//
//  Created by Lincoln Blouin (student LM) on 12/15/20.
//  Copyright © 2020 Swope, Thomas. All rights reserved.
//

import SwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

struct ListingDetail: View {
    
    @EnvironmentObject var userInfo: UserInfo
    @EnvironmentObject var user: UserViewModel
    @Environment(\.presentationMode) var presentationMode
    @Binding var listing : Listing
    @Binding var listings : [Listing]
    var activityTypeOptions : [String] = ["Yard Work","Shoveling","Pool Care", "Christmas Lights", "Landscaping"]
    var numberOfPeopleOptions : [String] = ["1", "2", "3+"]
    
    
    var body: some View {
        VStack {
            Image("brown-1")
                .resizable()
                .aspectRatio(contentMode: .fill)
               // .clipShape(Circle())
                .frame(width: 100, height: 100, alignment: .center)
            
            Form {
                Section {
                    TextField("Username", text: $listing.name)
                        .font(.system(size: 25))
                    TextField("Email Address", text: $listing.email)
                        .font(.system(size: 20))
                }
                Section {
                    Toggle(isOn: $listing.experienceRequired) {
                        Text("Experience Required")
                    }
                    Picker(selection: $listing.type, label: Text("Activity Type")) {
                        ForEach(0..<activityTypeOptions.count) { i in
                            Text(self.activityTypeOptions[i])
                        }
                    }
                }
                
                Section {
                    TextField("Hourly Pay Rate", text: $listing.hourlyRate)
                        .keyboardType(.decimalPad)
                    Picker(selection: $listing.type, label: Text("Number of People Needed")) {
                        ForEach(0..<numberOfPeopleOptions.count) { i in
                            Text(self.numberOfPeopleOptions[i])
                        }
                    }
                }
            }
            Button(action: {
                self.listings.append(self.listing)
                

            }) {
                Text("Add Listing")
            }
        }
    }
}

struct ListingDetail_Previews: PreviewProvider {
    static var previews: some View {
        ListingDetail(listing: Binding.constant(Listing(image: "joe mama", name: "ben", email: "ben@ben.ben")), listings: Binding.constant([Listing(image: "yard work", name: "John Smith", email: "jsmith@gmail.com", experienceRequired: false, type: "Yard Work", hourlyRate: "$25", numberOfPeople: "1", isAccepted: false),
        Listing(image: "shoveling", name: "Jane Doe", email: "janedoe@icloud.com", experienceRequired: false, type: "Shoveling", hourlyRate: "$20", numberOfPeople: "2", isAccepted: false),
        Listing(image: "pool care", name: "Thomas Brady", email: "tom@TB12.com", experienceRequired: true, type: "Pool Care", hourlyRate: "$100", numberOfPeople: "1", isAccepted: false),
        Listing(image: "landscaping", name: "Joseph Johnson", email: "JJ@harvard.edu", experienceRequired: true, type: "Landscaping", hourlyRate: "$40", numberOfPeople: "3+", isAccepted: false),Listing(image: "christmas lights", name: "Kris Kringle", email: "SClaus@thenorthpole.com", experienceRequired: true, type: "Yard Christmas Lights", hourlyRate: "$42", numberOfPeople: "2", isAccepted: false)]))
    }
}
