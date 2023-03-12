//
//  Base.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//

import SwiftUI

struct Base: View {
    @EnvironmentObject var usersettings: UserSettings
    
    var body: some View {
        if usersettings.isLoggedIn {
            TabViews()
            
        }else{
            Login()
        }
    }
}

struct Base_Previews: PreviewProvider {
    static var previews: some View {
        Base()
    }
}
