//
//  SignUpView.swift
//  Messenger
//
//  Created by Edgar Vergara on 18/08/23.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var email = ""
    @State var password = ""
    @State var fullname = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            // logo
            Image("messenger_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding()
            
            // textfields
            VStack {
                TextField("Enter your email...", text: $email)
                    .modifier(MSTextFieldModifier())
                
                TextField("Enter your fullname...", text: $fullname)
                    .modifier(MSTextFieldModifier())
                
                SecureField("Enter your password...", text: $password)
                    .modifier(MSTextFieldModifier())
            }
            
            // sign up button
            Button {
                print("sign up")
            } label: {
                Text("Sign up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 45)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
            }
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            // sign up link
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    
                    Text("Sign In")
                        .fontWeight(.bold)
                }
                .font(.footnote )
            }
            .padding()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
