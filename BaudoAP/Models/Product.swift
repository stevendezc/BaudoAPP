//
//  Post.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//


import SwiftUI
import FirebaseFirestoreSwift

struct Product: Identifiable,Codable {
    var id: String?
    var title: String
    var thumbnail: String
    var sizes: String
    var description: String
    var gallery: String
    var price: String
    var type: String
    var creation_date: Date
    
    var creationDateString: String {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE, dd 'of' MMMM"
            return formatter.string(from: creation_date)
        }
}
