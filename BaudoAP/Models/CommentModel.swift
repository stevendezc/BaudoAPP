//
//  CommentModel.swift
//  BaudoAP
//
//  Created by Codez on 31/03/23.
//

import Foundation
import Firebase

struct CommentModel: Identifiable {
    var id = UUID()
//    var profile: String
    var postId: String
    var userId: String
//    var username: String
//    var date: Double
    var commentText: String
//    var ownerId: String
    var timestamp:  Timestamp?
}
