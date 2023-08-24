//
//  ActiveNowView.swift
//  Messenger
//
//  Created by Edgar Vergara on 19/08/23.
//

import SwiftUI

struct ActiveNowView: View {
    @StateObject var activeNowVM = ActiveNowViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 25) {
                ForEach(activeNowVM.users) { user in
                    NavigationLink(value: Route.chatView(user)) {
                        VStack {
                            ZStack (alignment: .bottomTrailing) {
                                CircularProfileImageView(user: user, size: .medium)
                                
                                ZStack {
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 18, height: 18)
                                    
                                    Circle()
                                        .fill(Color(.systemGreen))
                                        .frame(width: 12, height: 12)
                                }
                            }
                            
                            Text(user.firstName)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .padding()
        }
        .frame(height: 106)
    }
}

struct ActiveNowView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveNowView()
    }
}
