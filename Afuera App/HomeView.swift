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
    @State private var image: Image = Image("joe mama")
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    @State var user: UserViewModel = UserViewModel()
    @State var listings : [Listing] =
    [Listing(image: "joe mama", name: "Ben", email: "BenSmith@NewWaveComputers.com"),
     Listing(image: "joe mama", name: "Aslan", email: "BenSmith@NewWaveComputers.com"),
     Listing(image: "joe mama", name: "Humphrey", email: "BenSmith@NewWaveComputers.com"),
     Listing(image: "joe mama", name: "Joseph", email: "BenSmith@NewWaveComputers.com"),
     Listing(image: "joe mama", name: "Kelly", email: "BenSmith@NewWaveComputers.com"),
     Listing(image: "joe mama", name: "Michael", email: "BenSmith@NewWaveComputers.com"),
     Listing(image: "joe mama", name: "Prince", email: "BenSmith@NewWaveComputers.com"),
     Listing(image: "joe mama", name: "Tyler", email: "BenSmith@NewWaveComputers.com")
        ].sorted(by: {$0.name < $1.name})
    
    
    func loadName() -> String{

        guard let uid  = Auth.auth().currentUser?.uid else {return " "}

        var ref: DatabaseReference!
        var r = "name"

        ref = Database.database().reference()

        ref.child("users/\(uid)/name").getData { (error, snapshot) in

            if let error = error {

                print("Error getting data \(error)")

            }

             r = snapshot.value! as! String

        }
        
        return r

    }
    
    
    
    
    
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
        
        
        
        NavigationView {
            ZStack {
            //background
                Image("backend-1").resizable().edgesIgnoringSafeArea(.all).aspectRatio(contentMode: .fill).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .bottom)
                
                VStack {
                    Spacer()
                    
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150, alignment: .center)
                        .clipped()
                        .cornerRadius(200)
                    
                    Text("\(loadName())")
                            .padding()
                    
                    
                    
                    Button(action: {
                        self.showingImagePicker = true
                    }) {
                        Text("Change Image")
                            .frame(width: 180)
                            .padding(.vertical, 15)
                            .background(Color.blue)
                            .cornerRadius(8)
                            .foregroundColor(.white)
                    }.padding()
                    
                    
                    
                    
                    
                    ListingsButton(listings: $listings)
                            .padding()
                    
                        AcceptedListingsButton()
                            .padding()
                    
                    
                    Spacer()
        
                    
                    
                    Button(action: {
                        try! Auth.auth().signOut()
                        self.userInfo.configureFirebaseStateDidChange()
                    }) {
                        Text("Log Out")
                            .frame(width: 180)
                            .padding(.vertical, 15)
                            .background(Color.blue)
                            .cornerRadius(8)
                            .foregroundColor(.white)
                        
                    }.padding()
                    Spacer()
                }.sheet(isPresented: $showingImagePicker, onDismiss: saveImage) {
                    ImagePicker(image: self.$inputImage)
                    
                }
                
                
            }
        }
        
        
        
        //            VStack {
        //                //name
        //
        //                Text("MOD").foregroundColor(Color.white).position(x: 210, y: 5)
        //                Spacer()
        //                //game title
        //                Text("MOD").fontWeight(.heavy).foregroundColor(Color.red)
        //                    .font(.largeTitle).position(x: 210, y: 230)
        //                Spacer()
        //            }
        //        }
    }
}





struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
