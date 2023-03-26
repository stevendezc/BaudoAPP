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
    
    @State var audioPlayer: AVPlayer!
    
    var model: Post
    @State private var blurAmount = 0.0
    @Binding var isPresentedPodcast: Bool
    
    
    
    var body: some View {
        
        
        ZStack{
            WebImage(url: URL(string: model.Thumbnail))
                .resizable()
                .frame(width:UIScreen.main.bounds.width,
                       height:UIScreen.main.bounds.height)
                .aspectRatio(contentMode: .fit)
                .blur(radius: blurAmount)
            
            ScrollView{
                Spacer(minLength: 50)
                
                HStack{
                    
                    WebImage(url: URL(string: model.Thumbnail))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:130)
                    //                .border(Color.red, width: 3)
                    
                    VStack(alignment: .leading,spacing: 5) {
                        HStack{
                            Text(model.Title).font(.title3)
                            
                            Button {
                                Play()
                                print("Button Pressed")
                            } label: {
                                Image(systemName: "play")
                            }
                            
                        }
                        
                        Text(model.CreationDate).font(.callout)
                        Text(model.Description).font(.caption)
                        
                    }.foregroundColor(Color("Text"))
                    
                }
                .padding(15)
                .background(Color("BackgroundCards"))
                .cornerRadius(20)
                
                VStack{
                    Text("Comentarios Aqui")
                    Slider(value: $blurAmount, in: 0...20)
                    
                }
                
                .padding(20)
                .background(Color("BackgroundCardsPodcast"))
                .cornerRadius(24)
                .padding(10)
                
            }.padding(10)
            
        }.onAppear() {
            Play()
        }
        
    }
    func Play() {
        let storage = Storage.storage().reference(forURL: self.model.MainMediaUrl)
        storage.downloadURL { (url, error) in
            if error != nil {
                print(error)
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
}



struct PostCardPodcastDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        PostCardPodcastDetail(model: Post(id: "10",Thumbnail: "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Podcasts%2FRecurso%2027%402x-8%201.png?alt=media&token=ef46631c-aaee-42fb-8b3d-5213653fe7ba", Author: "BaudoAP", Location: "Triguba,Choco", MainMediaUrl: "https://firebasestorage.googleapis.com/v0/b/baudoapswift.appspot.com/o/Pic2-50.jpg?alt=media&token=7ec8709e-9dc6-4ce3-af94-566d48251d60", Typo: "Imagen", Description: "Esta es una breve descripcion de contenido de Podcast para pruebas en el postCardPodcast y para solo visualizar como se veria el texto en las cartas del home", Category: "Medio Ambiente",Title: "Los rastros del cambio climatico",CreationDate: "23/Marzo/2023"), isPresentedPodcast: .constant(false))
        
    }
}



