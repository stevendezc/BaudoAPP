//
//  CommentModel.swift
//  BaudoAP
//
//  Created by Codez on 31/03/23.
//

import Foundation

struct CommentModel: Encodable, Decodable, Identifiable {
    var id = UUID()
//    var profile: String
    var postId: String
//    var username: String
//    var date: Double
    var commentText: String
//    var ownerId: String
}
