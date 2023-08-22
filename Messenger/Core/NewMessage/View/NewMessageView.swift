//
//  NewMessageView.swift
//  Messenger
//
//  Created by Edgar Vergara on 20/08/23.
//

import SwiftUI

struct NewMessageView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var searchText = ""
    
    @Binding var selectedUser: User?
    
    @StateObject var newMessageVM = NewMessageViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                TextField("To...", text: $searchText)
                    .frame(height: 44)
                    .padding(.leading)
                    .background(Color(.systemGroupedBackground))
                
                Text("CONTACTS")
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ForEach(newMessageVM.users) { user in
                    VStack {
                        HStack {
                            CircularProfileImageView(user: user, size: .small)
                            
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Spacer()
                        }
                        
                        Divider()
                            
                    }
                    .padding(.horizontal)
                    .onTapGesture {
                        selectedUser = user
                        dismiss()
                    }
                }
            }
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.black)
                }
        }
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationStack {
            NewMessageView(selectedUser: .constant(User.MOCK_USER))
        }
    }
}
