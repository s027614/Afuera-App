//
//  SignUpView.swift
//  Signin With Apple
//
//  Created by Stewart Lynch on 2020-03-19.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

struct SignUpView: View {
    @EnvironmentObject var userInfo: UserInfo
    @EnvironmentObject var user: UserViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                Group {
                    VStack(alignment: .leading) {
                        
                        TextField("Full Name", text: self.$user.fullname).autocapitalization(.words)
                        if !user.validNameText.isEmpty {
                            Text(user.validNameText).font(.caption).foregroundColor(.red)
                        }
                    }
                    VStack(alignment: .leading) {
                        TextField("Address", text: self.$user.address).autocapitalization(.words)
                        if !user.validAddress.isEmpty {
                            Text(user.validAddress).font(.caption).foregroundColor(.red)
                        }
                    }
                    VStack(alignment: .leading) {
                        TextField("Zip-Code", text: self.$user.zipcode).autocapitalization(.words)
                        if !user.validZipCode.isEmpty {
                            Text(user.validZipCode).font(.caption).foregroundColor(.red)
                        }
                    }
                    VStack(alignment: .leading) {
                        TextField("Email Address", text: self.$user.email).autocapitalization(.none).keyboardType(.emailAddress)
                        if !user.validEmailAddressText.isEmpty {
                            Text(user.validEmailAddressText).font(.caption).foregroundColor(.red)
                        }
                    }
                    VStack(alignment: .leading) {
                        SecureField("Password", text: self.$user.password)
                        if !user.validPasswordText.isEmpty {
                            Text(user.validPasswordText).font(.caption).foregroundColor(.red)
                        }
                    }
                    VStack(alignment: .leading) {
                        SecureField("Confirm Password", text: self.$user.confirmPassword)
                        if !user.passwordsMatch(_confirmPW: user.confirmPassword) {
                            Text(user.validConfirmPasswordText).font(.caption).foregroundColor(.red)
                        }
                    }
                }.frame(width: 300)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                VStack(spacing: 20 ) {
                    Button(action: {
                        
                        Auth.auth().createUser(withEmail: self.user.email, password: self.user.password){ user, error in
                            if let _ = user {
                                self.presentationMode.wrappedValue.dismiss()
                                print("user created")
                                
                                
                                
                                //Save address
                                guard let uid = Auth.auth().currentUser?.uid else {return}
                                let database = Database.database().reference()
                                
                                database.child("users/\(uid)/fullname").setValue(self.user.fullname)
                                
                                database.child("users/\(uid)/address").setValue(self.user.address)
                                
                                database.child("users/\(uid)/zipcode").setValue(self.user.zipcode)
                                
                                
                                
                            }
                            else{
                                print(error.debugDescription)
                            }
                        }
                        
                        
                        
                        
                        
                        
                        
                        
                    }) {
                        Text("Register")
                            .frame(width: 200)
                            .padding(.vertical, 15)
                            .background(Color.green)
                            .cornerRadius(8)
                            .foregroundColor(.white)
                            .opacity(user.isSignInComplete ? 1 : 0.75)
                    }
                    .disabled(!user.isSignInComplete)
                    Spacer()
                }.padding()
            }.padding(.top)
                .navigationBarTitle("Sign Up", displayMode: .inline)
                .navigationBarItems(trailing: Button("Dismiss") {
                    self.presentationMode.wrappedValue.dismiss()
                })
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
