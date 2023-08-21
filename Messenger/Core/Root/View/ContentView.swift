//
//  ContentView.swift
//  Messenger
//
//  Created by Edgar Vergara on 18/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var contentVM = ContentViewModel()
    
    var body: some View {
        Group {
            if(contentVM.userSession != nil) {
                InboxView()
            }
            else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
