//
//  SignInWithEmailView.swift
//  Signin With Apple
//
//  Created by Stewart Lynch on 2020-03-19.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct SignInWithEmailView: View {
    @EnvironmentObject var userInfo: UserInfo
    @EnvironmentObject var user: UserViewModel
    @Binding var showSheet: Bool
    @Binding var action:LoginView.Action?
    var body: some View {
        VStack {
            Image("brown-1").resizable().aspectRatio(contentMode: .fit).padding(.all, 7.0)
            TextField("Email Address",
                      text: self.$user.email)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            SecureField("Password", text: self.$user.password)
            HStack {
                Spacer()
                Button(action: {
                    self.action = .resetPW
                    self.showSheet = true
                }) {
                    Text("Forgot Password")
                }
            }.padding(.bottom)
            VStack(spacing: 10) {
                Button(action: {
                    Auth.auth().signIn(withEmail: self.user.email, password: self.user.password) { (user, error) in
                        self.userInfo.configureFirebaseStateDidChange()
                        self.user.getData()
                    }
                }) {
                    Text("Login")
                        .padding(.vertical, 15)
                        .frame(width: 200)
                        .background(Color.green)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        .opacity(user.isLogInComplete ? 1 : 0.75)
                }.disabled(!user.isLogInComplete)
                Button(action: {
                    self.action = .signUp
                    self.showSheet = true
                }) {
                    Text("Sign Up")
                        .padding(.vertical, 15)
                        .frame(width: 200)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
            }
        }
        .padding(.top, 100)
        .frame(width: 300)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        
    }
}

struct SignInWithEmailView_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithEmailView(showSheet: .constant(false), action: .constant(.signUp))
    }
}
