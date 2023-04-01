//
//  UserComunidad.swift
//  BaudoAP
//
//  Created by Codez on 26/03/23.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift
import Firebase


struct Users: Codable, Identifiable {
    var id: String?
    var Thumbnail: String
    var Description: String
    var CategoryCom: String
    var Title: String
    var CreationDate: Date
    var Instagram: String
    var Facebook: String
    var Twitter: String
    var Whatsapp: String
    
    var CreationDateString: String {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE, dd 'of' MMMM"
            return formatter.string(from: CreationDate)
        }
}
