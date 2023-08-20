//
//  ProfileView.swift
//  Messenger
//
//  Created by Edgar Vergara on 20/08/23.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
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
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(Color(.systemGray4))
                    }
                    
                }
                
                Text("Bruce Wayne")
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
        ProfileView()
    }
}
