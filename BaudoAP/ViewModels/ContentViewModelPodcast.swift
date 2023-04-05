//
//  ContentViewModelPodcast.swift
//  BaudoAP
//
//  Created by Codez on 24/03/23.
//

import Foundation


import SwiftUI
import FirebaseFirestore
import Firebase
import FirebaseAuth

class ContentViewModelPodcast: ObservableObject {
    @Published var postsPodcast: [Post] = []
    
    @Published var comments: [CommentModel] = []
    
    @Published var commentText = ""
    @Published var errorMessage = ""
    
    @Published var commentId = ""
    
    @Published var currentCommentId = ""
    
    @Published var userId = ""
    
    @Published var postId = ""
    
    private var listenerRegistration: ListenerRegistration?
    
    
    init() {
        fetchpostsPodcast()
    }
    
//    Function for Fetch posts from firebase
    func fetchpostsPodcast() {
        
        // NECESARIO ??
       postsPodcast.removeAll()
        let dbPod = Firestore.firestore()
        
        let refPodcast = dbPod.collection("Posts").whereField("Typo", isEqualTo: "Podcast").order(by: "CreationDate" ,descending: true)
        
        //let ImagenesContent = db.collection("Posts").whereField("Tipo", isEqualTo: "Imagen")
        
//        print("Estos son los post de Imagenes", refImage)
        

        print("Firestore query started PODCAST")
        refPodcast.getDocuments { snapshot, error in
            guard error == nil else{
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {

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
                    let Title = data["Title"] as? String ?? ""
                    let CreationDate = data["CreationDate"] as? String ?? ""
                    
                    let postpodcast = Post(id: id,Thumbnail: Thumbnail,Thumbnail2: Thumbnail2,Author: Author,Location: Location, MainMediaUrl: MainMediaUrl, Typo: Typo, Description: Description,Category: Category,Title: Title,CreationDate: CreationDate)
                    self.postsPodcast.append(postpodcast)
                    
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
        
        let db = Firestore.firestore().collection("Comments").document()
        
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
        
        let docRef = dbPosts.collection("Posts").document(postId)
        
        //        docRef.setData(["Comments": FieldValue.arrayUnion([currentCommentId])], merge: true)
        docRef.updateData(["Commentaries": FieldValue.arrayUnion([currentCommentId])]){ error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written!")
               self.fetchNewComments(postId: postId)
            }
        }
    }
    
    
    
    func fetchNewComments(postId: String){
        print("ingrese")
        comments.removeAll()
        let db = Firestore.firestore().collection("Comments")
            .whereField("postId", isEqualTo: postId)
            .order(by: "timestamp" ,descending: true)
        
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
                        self.comments.append(comment)
                    }
                })
                
//                querySnapshot?.documents.forEach({ queryDocumentSnapshot in
//                    let data = queryDocumentSnapshot.data()
//
//                    let Id: String = UUID().uuidString
//                    let commentText = data["commentText"] as? String ?? ""
//                    let userId = data["userId"] as? String ?? ""
//
//                    let comment = CommentModel(postId: Id, userId: userId, commentText: commentText, timestamp: Timestamp())
//                    self.comments.append(comment)
//
//                })
                
            }
    }
    
    func stopListener() {
        print("sali")
        listenerRegistration?.remove()
    }
    
   
}

