//
//  ContentViewModelShop.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//

import Foundation

import SwiftUI
import FirebaseFirestore
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ContentViewModelShop: ObservableObject {
    @Published var postsProducts: [Product] = []
//
//    @Published var comments: [CommentModel] = []
    
//    @Published var commentText = ""
//    @Published var errorMessage = ""
//
//    @Published var commentId = ""
//
//    @Published var currentCommentId = ""
//
//    @Published var userId = ""
//
    @Published var postId = ""
    
    private var listenerRegistration: ListenerRegistration?
    
//    @Published var newCommentText: String = ""
    
    init() {
        Task{
            try await fetchpostsProducts()
        }
        //        print("Fetch from init in the content view IMAGES")
//        fetchNewComments()
    }
    
    //    Function for Fetch posts from firebase
    func fetchpostsProducts() async throws {
        
        // NECESARIO ??
        postsProducts.removeAll()
        let dbProducts = Firestore.firestore()
        let refProducts = dbProducts.collection("productos").order(by: "creation_date" ,descending: true)
//            .whereField("type", isEqualTo: "image")
        //let ImagenesContent = db.collection("Posts").whereField("Tipo", isEqualTo: "Imagen")
        
        //        print("Estos son los post de Imagenes", refImage)
        
        //        print("Firestore query started IMAGES")
        refProducts.getDocuments { snapshot, error in
            //            print("Firestore query started IMAGES - GOT DOCUMENT")
            guard error == nil else{
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                //                print("Firestore query started IMAGES - SNAPSHOT")
                for document in snapshot.documents {
                    //                    var num = 0
                    //                    print("Firestore query started IMAGES - DOCUMENTS", num)
                    //                    num += 1
                    let data = document.data()
                    let uid = document.documentID
                    
                    let id = uid
                    let title = data["title"] as? String ?? ""
                    let thumbnail = data["thumbnail"] as? String ?? ""
                    let sizes = data["sizes"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    let gallery = data["gallery"] as? String ?? ""
                    let price = data["price"] as? String ?? ""
                    let type = data["type"] as? String ?? ""
                
                    
                    let creation_date = (data["creation_date"] as? Timestamp)?.dateValue() ?? Date()
                    
                    let postproduct = Product(id: id, title: title, thumbnail: thumbnail, sizes: sizes, description: description, gallery: gallery, price: price,type: type, creation_date: creation_date)
                    self.postsProducts.append(postproduct)
                    
                    //                    print(self.postsImages)
                }
            }
        }
    }
    
    
    
    
    
    
}
