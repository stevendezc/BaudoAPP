//
//  PostCardPodcastDetail.swift
//  BaudoAP
//
//  Created by Codez on 25/03/23.
//

import SwiftUI
import SDWebImageSwiftUI
import AVFoundation
import Firebase
import FirebaseStorage



struct PostCardPodcastDetail: View {
    
    @ObservedObject var contentPodcast = ContentViewModelPodcast()
    
    @State var audioPlayer: AVPlayer!
    
    @State var isPlaying : Bool = true
    
    var model: Post
    @State private var blurAmount = 0.0
    @Binding var isPresentedPodcast: Bool
    
    
    
    var body: some View {
        
        ScrollView{
                
                
            ZStack(alignment: .topLeading){
                Spacer(minLength: 60)
                    WebImage(url: URL(string: model.Thumbnail2))
                        .resizable()
                        .frame(width:UIScreen.main.bounds.width,
                               height:UIScreen.main.bounds.height)
                        .aspectRatio(contentMode: .fit)
                        .blur(radius: blurAmount)
                    VStack{
                        HStack{
                            Button("X"){
                                isPresentedPodcast = false
                            }
                            .padding(.horizontal,10)
                            .padding(.vertical,4)
                            .foregroundColor(.white)
                            .background(Color.yellow)
                            .cornerRadius(30)
                            .font(.system(size: 25))
                            Spacer()
                        }.padding(.top,60)
                        
                        
                        VStack(alignment: .leading){
                            
                            
                            HStack{
                                
                                WebImage(url: URL(string: model.Thumbnail))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:100)
                                //                .border(Color.red, width: 3)
                                
                                VStack(alignment: .leading,spacing: 5) {
                                    HStack{
                                        Text(model.Title)
                                            .font(.custom("SofiaSans-Bold", size: 18,relativeTo: .title))
                                        .fontWeight(.heavy)
                                        
                                        Button {
                                            playPause()
                                            print("Button Pressed")
                                        } label: {
                                            if isPlaying {
                                                Image("Pause")
                                            } else {
                                                Image("Play")
                                            }
                                            
                                        }
                                        .padding(.leading,40)
                                        .foregroundColor(Color("Buttons"))
                                         
                                    }
                                    
                                    Text(model.CreationDate).font(.callout)
                                    Text(model.Description).font(.caption)
                                    
                                }.foregroundColor(Color("Text"))
                                 .multilineTextAlignment(.leading)
                                
                                
                            }
                            
                            Slider(value: $blurAmount, in: 0...20)
                        }.padding(15)
                            .background(Color("BackgroundCards"))
                            .cornerRadius(20)
                        
                        
                        VStack{
                            
                            HStack{
                                Image("Iryvenir")
                                Spacer()
                                Text("Discusión").foregroundColor(Color("Text")).font(.custom("SofiaSans-Bold",size: 24,relativeTo: .title))
                                    .font(.custom(
                                        "SofiaSans",
                                        size: 18,
                                        relativeTo: .title))
                            }.padding(20)
                            
                            VStack(alignment: .leading){
                                HStack{
                                    Spacer()
                                }
                                VStack(alignment: .leading){
                                    
                                    ForEach(contentPodcast.comments){ comment in
                                        HStack{
                                            Image(systemName: "person.circle")
                                                .resizable()
                    //                            .border(Color.accentColor, width: 4)
                                                .frame(width: 50,height: 50,alignment: .center)
                                                .aspectRatio(contentMode: .fit)
                                                .clipShape(Circle())
                                                .padding(2)
                                                .overlay(
                                                        RoundedRectangle(cornerRadius: 30)
                                                            .stroke(Color("Buttons"), lineWidth: 1)
                                                    )
                                            Text(comment.commentText)
                                    }
                                        
                                    }
                                    .padding(10)
                                    .background(Color("BackgroundCardsPodcast").opacity(0.5))
                                    .cornerRadius(20)
                                    
                                    
                                }
                                
                            }.padding(20)
                            .background(Color("BackgroundCards").opacity(0.5))
                            .foregroundColor(Color("Text"))
                            .cornerRadius(20)
                            
                            
                        }
                        
                        .padding(20)
                        .background(Color("BackgroundCardsPodcast"))
                        .cornerRadius(24)
                        .padding(10)
                        
                    }.padding(10)
                    }
                
            
            
            
        }
//        .onAppear() {
//            Play()
//        }
        
        HStack{
            Image(systemName: "person.circle")
                .resizable()
//                            .border(Color.accentColor, width: 4)
                .frame(width: 50,height: 50,alignment: .center)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .padding(2)
                .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color("Buttons"), lineWidth: 1)
                    )
            
            TextField(
              "Agregar comentario",
              text: $contentPodcast.commentText
            )
            .foregroundColor(Color("Text"))
            .padding()
            .background(Color("BackgroundCards"))
            .cornerRadius(19)
            Button{
                contentPodcast.pushComment(postId: model.id ?? "")
                
                print("Pusshed Comment YEYYYY",model.id ?? "")
            } label: {
                Text("Enviar")
            }
            .buttonStyle(.borderedProminent)
        }.padding(.bottom,30).padding(.horizontal,5)
        .onAppear(){
            contentPodcast.fetchNewComments(postId: model.id ?? "")
            Play()
        }
        .onDisappear(){
            contentPodcast.stopListener()
        }
        
    }
    func Play() {
        let storage = Storage.storage().reference(forURL: self.model.MainMediaUrl)
        storage.downloadURL { (url, error) in
            if error != nil {
                print(error ?? "Error")
            } else {
                do {
                    try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
                }
                catch{
//                    Report for an error
                }
                audioPlayer = AVPlayer(url: url!)
                audioPlayer.play()
            }
            
            
        }
    }
    func playPause() {
        self.isPlaying.toggle()
        if isPlaying == false {
            audioPlayer.pause()
        } else {
            audioPlayer.play()
        }
    }
}



struct PostCardPodcastDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PostCardPodcastDetail(model: Post(id: "1",Thumbnail: "https://baudoap.com/wp-content/uploads/2023/01/GUERRILLERO-IMPASIBLE.jpg",Thumbnail2:  "https://baudoap.com/wp-content/uploads/2023/01/GUERRILLERO-IMPASIBLE.jpg", Author: "BaudoAP", Location: "Triguba,Choco", MainMediaUrl: "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Podcasts%2FAudios%2FIr-y-venir-Los-rastros-del-cambi.mp3?alt=media&token=f0eba787-9b98-46e3-a2c7-4d510e7f7b13", Typo: "Imagen", Description: "Esta es una breve descripcion de contenido de Podcast para pruebas en el postCardPodcast y para solo visualizar como se veria el texto en las cartas del home", Category: "Medio Ambiente",Title: "Los rastros del cambio climatico",CreationDate: "23/Marzo/2023"), isPresentedPodcast: .constant(true))
        }
    }
}



