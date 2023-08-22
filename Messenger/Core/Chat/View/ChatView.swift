//
//  ChatView.swift
//  Messenger
//
//  Created by Edgar Vergara on 20/08/23.
//

import SwiftUI

struct ChatView: View {
    let user: User
    
    @State private var messageText = ""
    
    var body: some View {
        VStack {
            ScrollView {
                // header
                VStack {
                    CircularProfileImageView(user: user, size: .xlarge)
                    
                    VStack(spacing: 5) {
                        Text(user.fullname)
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Messenger")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    
                }
                
                // messages
                ForEach(0 ... 15, id: \.self ) { message in
                    ChatMessageCell(isFromCurrentUser: Bool.random())
                }
            }
            
            // message input view
            ZStack(alignment: .trailing) {
                TextField("Message...", text: $messageText, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 60)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                
                Button {
                    print("sent message")
                } label: {
                    Text("Send")
                        .fontWeight(.semibold)
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(user: User.MOCK_USER)
    }
}
