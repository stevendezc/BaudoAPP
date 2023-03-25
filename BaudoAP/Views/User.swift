//
//  User.swift
//  BaudoAP
//
//  Created by Codez on 24/03/23.
//

import SwiftUI
import Firebase

struct User: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var userIsLogged : Bool
    
    @Binding var UserName: String
    
    var body: some View {
        List{
            Button("LogOut") {
                logout()
            }
            Text(colorScheme == .dark ? "Dark" : "Light").foregroundColor(Color("Text"))
            Text("UserName: \(UserName)")
        }
        
    }
    func logout(){
        try! Auth.auth().signOut()
        print("Logged out button pressed")
        userIsLogged = false
        
    }
}

struct User_Previews: PreviewProvider {
    static var previews: some View {
        User(userIsLogged: .constant(false), UserName: .constant("None"))
    }
}
