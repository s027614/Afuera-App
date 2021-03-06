//
//  HomeView.swift
//  FireDrill
//
//  Created by Elliot Ginzburg (student LM) on 2/10/21.
//  Copyright © 2021 Elliot Ginzburg (student LM). All rights reserved.
//

import SwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

struct HomeView: View {
    @EnvironmentObject var userInfo: UserInfo
    @State private var image: Image = Image("user")
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State var listings : [Listing] = [
        Listing(image: "yard work", name: "John Smith", email: "jsmith@gmail.com", address: "407 Fig Street", zipcode: "19003", experienceRequired: false, type: "Yard Work", hourlyRate: "25", numberOfPeople: "1", isAccepted: false, isComplete: false),
    Listing(image: "shoveling", name: "Jane Doe", email: "janedoe@icloud.com", address: "40 Apple Street", zipcode: "12345", experienceRequired: false, type: "Shoveling", hourlyRate: "20", numberOfPeople: "2", isAccepted: false, isComplete: false),
    Listing(image: "pool care", name: "Tomé Brady", email: "tom@tb12.com", address: "20 Plum Street", zipcode: "13047", experienceRequired: true, type: "Pool Care", hourlyRate: "100", numberOfPeople: "1", isAccepted: false, isComplete: false),
    Listing(image: "landscaping", name: "Jose John", email: "jj@harvard.edu", address: "4094 Pear Street", zipcode: "02378", experienceRequired: true, type: "Landscaping", hourlyRate: "40", numberOfPeople: "3+", isAccepted: false, isComplete: false),
    Listing(image: "christmas lights", name: "Kris Kring", email: "sclaus@thenorthpole.com", address: "12 Cherry Street", zipcode: "00001", experienceRequired: true, type: "Christmas Lights", hourlyRate: "42", numberOfPeople: "2", isAccepted: false, isComplete: false),
    Listing(image: "landscaping", name: "Lily Hobbs", email: "lilyhobbs@icloud.com", address: "423 Pop Street", zipcode: "19096", experienceRequired: true, type: "Landscaping", hourlyRate: "35", numberOfPeople: "3+", isAccepted: false, isComplete: false),
    Listing(image: "pool care", name: "Luka Donci", email: "luka@dallasmavs.com", address: "665 Yum Street", zipcode: "59086", experienceRequired: true, type: "Pool Care", hourlyRate: "85", numberOfPeople: "2", isAccepted: false, isComplete: false),
    Listing(image: "yard work", name: "Cecilia Bon", email: "CeceB@newwave.com", address: "33 Besties Street", zipcode: "32089", experienceRequired: false, type: "Yard Work", hourlyRate: "24", numberOfPeople: "2", isAccepted: false, isComplete: false)      ].sorted(by: {$0.name < $1.name})
    @State var acceptedListings : [Listing] = []
    
    @EnvironmentObject var user: UserViewModel
    
    
    @State var moneyEarned : Int = 0
    
    
    
    
    
    func saveImage(){
        guard let input = inputImage else {return}
        image = Image(uiImage: input)
        
        //get reference to current user
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        //get reference to the storage
        let storage = Storage.storage().reference().child("users/\(uid)")
        
        
        
        //images have to be saved as data objects to convert and compress
        
        guard let imageData = input.jpegData(compressionQuality: 0.75) else {return}
        
        storage.putData(imageData, metadata: StorageMetadata()){
            (metadata, error)
            in
            if let _ = metadata {
                storage.downloadURL { (url, error) in
                    guard let imageURL = url else { return }
                    
                    let database = Database.database().reference().child("users/\(uid)")
                    
                    let userObject: [String: Any] = ["photoURL": imageURL.absoluteString]
                    
                    database.setValue(userObject)
                }
            }
        }
    }
    var body: some View {
           
        ZStack {
               
                //background
                Image("backend-1")
               
            NavigationView{
                ZStack{
                    // Color.init("brown").edgesIgnoringSafeArea(.all).opacity(0.6)
                VStack {
                   
                     Image("brown-1").resizable().aspectRatio(contentMode: .fit).padding(.all, 2.0)

                    //Spacer()
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150, alignment: .center)
                        .clipped()
                        .cornerRadius(200)
                        
                    HStack{
                    Text("")
                    .padding(.vertical, 10)
                    Text("Lincoln Blouin")
                        
                    Text("1234 Main Street")
                    
                    Text("19003")
                    }.padding(.vertical, 10)
                    
                    
                    Text("$\(moneyEarned)").frame(width: 80)
                    .background(Color.green)
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    
                    
                    Button(action: {
                        self.showingImagePicker = true
                    }) {
                        Text("Change Image")
                            .frame(width: 120)
                            .padding(.vertical, 10)
                            .background(Color.green)
                            .cornerRadius(8)
                            .foregroundColor(.white)
                    }.padding()
                    
                    
                    

                    
                    ListingsButton(listings: self.$listings, acceptedListings: self.$acceptedListings, moneyEarned: self.$moneyEarned)
                            .padding(.vertical, 10)
                            
                    AcceptedListingsButton(acceptedListings: self.$acceptedListings,moneyEarned: self.$moneyEarned)
                            .padding(.vertical, 10)
                        
                    
                    
                    //Spacer()
                    
                    
                    
                    Button(action: {
                        try! Auth.auth().signOut()
                        self.userInfo.configureFirebaseStateDidChange()
                    }) {
                        Text("Log Out")
                            .frame(width: 80)
                            .padding(.vertical, 10)
                            .background(Color("brown"))
                            .cornerRadius(8)
                            .foregroundColor(.white)
                        
                    }.padding()
                    
                }
                .sheet(isPresented: $showingImagePicker, onDismiss: saveImage) {
                    ImagePicker(image: self.$inputImage).background(Color("brown"))
                    
                    }
                    
                }
            }
            
    }
    }
        
}





struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

