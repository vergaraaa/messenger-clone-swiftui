//
//  ProfileView.swift
//  Messenger
//
//  Created by Edgar Vergara on 20/08/23.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    let user: User
    
    @State var selectedImage: PhotosPickerItem?
    
    @StateObject var profileVM = ProfileViewModel()
    
    var body: some View {
        VStack {
            // header
            VStack {
                PhotosPicker(selection: $profileVM.selectedItem) {
                    if let profileImage = profileVM.profileImage {
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    }
                    else {
                        CircularProfileImageView(user: user, size: .xlarge)
                    }
                    
                }
                
                Text(user.fullname)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            
            // list
            List {
                Section {
                    ForEach(SettingsOptionsViewModel.allCases) { option in
                        HStack {
                            Image(systemName: option.imageName)
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(option.imageBackgroundColor)
                            
                            Text(option.title)
                                .font(.subheadline)
                        }
                    }
                }
                
                Section {
                    Button("Log Out") {
                        AuthService.shared.signOut() 
                    }
                    
                    Button("Delete account") {
                        
                    }
                }
                .foregroundColor(.red)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USER)
    }
}
