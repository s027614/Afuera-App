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

            Text("   Request Help:   ")
            .font(.system(size: 30))
            .foregroundColor(Color("greeny"))
            .minimumScaleFactor(0.0001)
                .background(Color("brown").opacity(0.6).cornerRadius(20))
            
            Form {
                Section {
                    TextField("Username", text: $listing.name)
                        .font(.system(size: 25))
                    TextField("Email Address", text: $listing.email)
                        .font(.system(size: 20))
                    TextField("Address", text: $listing.address)
                                       .font(.system(size: 20))
                    TextField("Zipcode", text: $listing.zipcode)
                        .font(.system(size: 20))
                }
                
                Section {
                    Toggle(isOn: $listing.experienceRequired) {
                        Text("Experience Required")
                    }
                    TextField("Type", text: $listing.type)
                    .font(.system(size: 20))
                    
                }
                
                Section {
                    TextField("Payment", text: $listing.hourlyRate)
                        .keyboardType(.decimalPad)
                    TextField("People Needed", text: $listing.numberOfPeople)
                        .keyboardType(.decimalPad)
                    
                    
                }
            }
            Button(action: {
                if self.listing.type == "Yard Work"{
                          
                self.listing.image = "yard work"
                      }
                      
                      else if self.listing.type == "Shoveling"{
                          
                      self.listing.image = "shoveling"
                      }
                      
                      else if self.listing.type == "Pool Care"{
                          
                    self.listing.image = "pool care"
                      }
                       
                       else if self.listing.type == "Christmas Lights"{
                           
                       self.listing.image = "christmas lights"
                       }
                       
                       else if self.listing.type == "Landscaping"{
                           
                       self.listing.image = "landscaping"
                       }
                self.listings.append(self.listing)
                

            }) {
                Text("+").font(.system(size: 30)).foregroundColor(.green)
            }
        }
    }
}

struct ListingDetail_Previews: PreviewProvider {
    static var previews: some View {
        ListingDetail(listing: Binding.constant(Listing(image: "joe mama", name: "ben", email: "ben@ben.ben")), listings: Binding.constant([
        Listing(image: "yard work", name: "John Smith", email: "jsmith@gmail.com", address: "407 Fig Street", zipcode: "19003", experienceRequired: false, type: "Yard Work", hourlyRate: "25", numberOfPeople: "1", isAccepted: false, isComplete: false),
           Listing(image: "shoveling", name: "Jane Doe", email: "janedoe@icloud.com", address: "40 Apple Street", zipcode: "12345", experienceRequired: false, type: "Shoveling", hourlyRate: "20", numberOfPeople: "2", isAccepted: false, isComplete: false),
           Listing(image: "pool care", name: "Tomé Brady", email: "tom@tb12.com", address: "20 Plum Street", zipcode: "13047", experienceRequired: true, type: "Pool Care", hourlyRate: "100", numberOfPeople: "1", isAccepted: false, isComplete: false),
           Listing(image: "landscaping", name: "Jose John", email: "jj@harvard.edu", address: "4094 Pear Street", zipcode: "02378", experienceRequired: true, type: "Landscaping", hourlyRate: "40", numberOfPeople: "3+", isAccepted: false, isComplete: false),
           Listing(image: "christmas lights", name: "Kris Kring", email: "sclaus@thenorthpole.com", address: "12 Cherry Street", zipcode: "00001", experienceRequired: true, type: "Christmas Lights", hourlyRate: "42", numberOfPeople: "2", isAccepted: false, isComplete: false),
           Listing(image: "landscaping", name: "Lily Hobbs", email: "lilyhobbs@icloud.com", address: "423 Pop Street", zipcode: "19096", experienceRequired: true, type: "Landscaping", hourlyRate: "35", numberOfPeople: "3+", isAccepted: false, isComplete: false),
           Listing(image: "pool care", name: "Luka Donci", email: "luka@dallasmavs.com", address: "665 Yum Street", zipcode: "59086", experienceRequired: true, type: "Pool Care", hourlyRate: "85", numberOfPeople: "2", isAccepted: false, isComplete: false),
           Listing(image: "yard work", name: "Cecilia Bon", email: "CeceB@newwave.com", address: "33 Besties Street", zipcode: "32089", experienceRequired: false, type: "Yard Work", hourlyRate: "24", numberOfPeople: "2", isAccepted: false, isComplete: false) ]))
    }
}

