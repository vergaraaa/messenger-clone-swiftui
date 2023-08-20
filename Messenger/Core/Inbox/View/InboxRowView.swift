//
//  InboxRowView.swift
//  Messenger
//
//  Created by Edgar Vergara on 19/08/23.
//

import SwiftUI

struct InboxRowView: View {
    var body: some View {
        HStack (alignment: .top, spacing: 12) {
            CircularProfileImageView(user: User.MOCK_USER, size: .large)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Heath Ledger")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("Some test message for now that spans more than one line")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }
            
            HStack {
                Text("Yesterday")
                
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundColor(.gray)
        }
        .frame(height: 72)
    }
}

struct InboxRowView_Previews: PreviewProvider {
    static var previews: some View {
        InboxRowView()
    }
}
