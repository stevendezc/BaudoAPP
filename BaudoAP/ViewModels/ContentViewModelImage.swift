//
//  ContentImage.swift
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

class ContentViewModelImage: ObservableObject {
    @Published var postsImages: [Post] = []
    
    @Published var comments: [CommentModel] = []
    
    @Published var commentText = ""
    @Published var errorMessage = ""
    
    @Published var commentId = ""
    
    @Published var currentCommentId = ""
    
    @Published var userId = ""
    
    @Published var postId = ""
    
    private var listenerRegistration: ListenerRegistration?
    
//    @Published var newCommentText: String = ""
    
    init() {
        fetchpostsImages()
        //        print("Fetch from init in the content view IMAGES")
//        fetchNewComments()
    }
    
    //    Function for Fetch posts from firebase
    func fetchpostsImages() {
        
        // NECESARIO ??
        postsImages.removeAll()
        let dbImg = Firestore.firestore()
        let refImage = dbImg.collection("posts").whereField("type", isEqualTo: "image").order(by: "creation_date" ,descending: true)
        
        //let ImagenesContent = db.collection("Posts").whereField("Tipo", isEqualTo: "Imagen")
        
        //        print("Estos son los post de Imagenes", refImage)
        
        //        print("Firestore query started IMAGES")
        refImage.getDocuments { snapshot, error in
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
                    let thumbnail = data["thumbnail"] as? String ?? ""
                    let thumbnail2 = data["thumbnail2"] as? String ?? ""
                    let author = data["author"] as? String ?? ""
                    let location = data["location"] as? String ?? ""
                    let main_media = data["main_media"] as? String ?? ""
                    let type = data["type"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    let category = data["category"] as? String ?? ""
                    let title = data["title"] as? String ?? ""
                    let creation_date = (data["creation_date"] as? Timestamp)?.dateValue() ?? Date()
                    
                    let postimage = Post(id: id, thumbnail: thumbnail,thumbnail2: thumbnail2, author: author,location: location, main_media: main_media, type: type, description: description,category: category,title: title,creation_date: creation_date)
                    self.postsImages.append(postimage)
                    
                    //                    print(self.postsImages)
                }
            }
        }
    }
    
    func pushComment(postId: String) {
        print("I MADE ITTT", postId)
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        print(userId)
        
        let db = Firestore.firestore().collection("commentaries").document()
        
        currentCommentId = db.documentID
        print("CurrentCOmmentID IS : \(currentCommentId)")
        
        self.postId = postId
        
        let messageData = ["postId": postId,"userId": userId, "commentText": self.commentText, "timestamp": Timestamp()] as [String : Any]
        
        //        db.setData(messageData, completion: {_ in
        //            print("CommentSaved")
        //        } )
        
        db.setData(messageData){ error in
            if let error = error{
                self.errorMessage = "Failed to save message into Firestore: \(error)"
                return
            } else {
//                self.fetchNewComments()
            }
        }
        
        self.commentText = ""
        
        let dbPosts = Firestore.firestore()
        
        let docRef = dbPosts.collection("posts").document(postId)
        
        //        docRef.setData(["Comments": FieldValue.arrayUnion([currentCommentId])], merge: true)
//        updateData
        docRef.updateData(["commentaries": FieldValue.arrayUnion([currentCommentId])]){ error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written!")
//               self.fetchNewComments(postId: postId)
            }
        }
    }
    
    
    
    func fetchNewComments(postId: String){
        print("ingrese")
        comments.removeAll()
        let db = Firestore.firestore().collection("commentaries")
            .whereField("postId", isEqualTo: postId)
            .order(by: "timestamp" ,descending: false)
        
//        comments.removeAll()
        
        listenerRegistration = db.addSnapshotListener{ querySnapshot, error in
                if let error = error {
                    self.errorMessage = "Failed to listen for new comments: \(error)"
                    print(error)
                    return
                }
            
            
            querySnapshot?.documentChanges.forEach({ change in
                if change.type == .added {
                    let data = change.document.data()
                    
                    let Id: String = UUID().uuidString
                    let commentText = data["commentText"] as? String ?? ""
                    let userId = data["userId"] as? String ?? ""

                    let comment = CommentModel(postId: Id, userId: userId, commentText: commentText, timestamp: Timestamp())
                    self.comments.insert(comment, at: 0)
                }
//                else if change.type == .modified {
//                    print("Un Archivo ha sido modificado en la base de datos")
//                }
                
            })
                
            }
    }
    
    func stopListener() {
        print("sali")
        listenerRegistration?.remove()
    }
    
}
