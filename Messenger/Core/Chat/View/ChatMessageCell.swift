//
//  ChatMessageCell.swift
//  Messenger
//
//  Created by Edgar Vergara on 20/08/23.
//

import SwiftUI

struct ChatMessageCell: View {
    let isFromCurrentUser: Bool
    
    var body: some View {
        HStack {
            if(isFromCurrentUser) {
                Spacer()
                
                Text("this is a test message for now this is a test message for now this is a test message for now")
                    .font(.subheadline)
                    .padding()
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.5, alignment: .trailing)
            }
            else {
                HStack(alignment: .bottom,spacing: 8) {
                    CircularProfileImageView(user: User.MOCK_USER, size: .xxsmall)
                    
                    Text("this is a test message for now this is a test message for now this is a test message for now")
                        .font(.subheadline)
                        .padding()
                        .background(Color(.systemGray5))
                        .foregroundColor(.black)
                        .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                        .frame(maxWidth: UIScreen.main.bounds.width / 1.75, alignment: .leading)
                    
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
    }
}

struct ChatMessageCell_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessageCell(isFromCurrentUser: false)
    }
}
