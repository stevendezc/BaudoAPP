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

class ContentViewModelImage: ObservableObject {
    @Published var postsImages: [Post] = []
    
    @Published var comments: [CommentModel] = []
    
    @Published var commentText = ""
    @Published var errorMessage = ""
    
    @Published var commentId = ""
    
    @Published var currentCommentId = ""
    
    @Published var userId = ""
    
    init() {
        fetchpostsImages()
        //        print("Fetch from init in the content view IMAGES")
        fetchNewComments()
    }
    
    //    Function for Fetch posts from firebase
    func fetchpostsImages() {
        
        // NECESARIO ??
        postsImages.removeAll()
        let dbImg = Firestore.firestore()
        let refImage = dbImg.collection("Posts").whereField("Typo", isEqualTo: "Image").order(by: "CreationDate" ,descending: true)
        
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
                    let Thumbnail = data["Thumbnail"] as? String ?? ""
                    let Thumbnail2 = data["Thumbnail2"] as? String ?? ""
                    let Author = data["Author"] as? String ?? ""
                    let Location = data["Location"] as? String ?? ""
                    let MainMediaUrl = data["MainMediaUrl"] as? String ?? ""
                    let Typo = data["Typo"] as? String ?? ""
                    let Description = data["Description"] as? String ?? ""
                    let Category = data["Category"] as? String ?? ""
                    let CreationDate = data["CreationDate"] as? String ?? ""
                    
                    let postimage = Post(id: id, Thumbnail: Thumbnail,Thumbnail2: Thumbnail2, Author: Author,Location: Location, MainMediaUrl: MainMediaUrl, Typo: Typo, Description: Description,Category: Category,Title: "Title",CreationDate: CreationDate)
                    self.postsImages.append(postimage)
                    
                    //                    print(self.postsImages)
                }
            }
        }
    }
    
    func pushComment(postId: String) {
        //        Get uuid
        //        Push textfield y guardar en collection de comments - Author - Post UUID - Timestamp - Text
        
        
        print("I MADE ITTT", postId)
        
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        print(userId)
        
        let db = Firestore.firestore().collection("Comments").document()
        
        currentCommentId = db.documentID
        print("CurrentCOmmentID IS : \(currentCommentId)")
        
        let messageData = ["userId": userId, "commentText": self.commentText, "timestamp": Timestamp()] as [String : Any]
        
//        db.setData(messageData, completion: {_ in
//            print("CommentSaved")
//        } )
        
        db.setData(messageData){ error in
            if let error = error{
                self.errorMessage = "Failed to save message into Firestore: \(error)"
                return
            } else {
                self.fetchNewComments()
            }
        }
        
        self.commentText = ""
        
        
        let dbPosts = Firestore.firestore()

        let docRef = dbPosts.collection("Posts").document(postId)

//        docRef.setData(["Comments": FieldValue.arrayUnion([currentCommentId])], merge: true)
        docRef.updateData(["Commentaries": FieldValue.arrayUnion([currentCommentId])])
//
//            docRef.setData(["name": restaurantName]) { error in
//                if let error = error {
//                    print("Error writing document: \(error)")
//                } else {
//                    print("Document successfully written!")
//                }
//            }
//        }
        
//        HERE INJECT CommentID to PostID
//        let dbPosts = Firestore.firestore()
//
//        let dbRef = dbPosts.collection("Posts").document(postId)
//
//        dbRef.setData{ error in
//            if let error = error {
//                print("Error writing document: \(error)")
//            } else {
//                print("Document successfully written!")
//            }
//        }
        
        
        
        
    }
    
    
    
    
    
    func fetchNewComments(){
        var db = Firestore.firestore()
            .collection("Comments")
            .addSnapshotListener{ querySnapshot, error in
                if let error = error {
                    self.errorMessage = "Failed to listen for new comments: \(error)"
                    print(error)
                    return
                }
                
                querySnapshot?.documents.forEach({ queryDocumentSnapshot in
                    let data = queryDocumentSnapshot.data()
                    
                    let Id: String = UUID().uuidString
                    let commentText = data["commentText"] as? String ?? ""
                    let userId = data["userId"] as? String ?? ""
                    
                    let comment = CommentModel(postId: Id, commentText: commentText)
                    self.comments.append(comment)
                    
                })
            
            }
    }
}
