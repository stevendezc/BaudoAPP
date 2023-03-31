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
    
    @State var isPlaying : Bool = true
    
    var model: Post
    @State private var blurAmount = 0.0
    @Binding var isPresentedPodcast: Bool
    
    
    
    var body: some View {
        
        
        ZStack{
            WebImage(url: URL(string: model.Thumbnail2))
                .resizable()
                .frame(width:UIScreen.main.bounds.width,
                       height:UIScreen.main.bounds.height)
                .aspectRatio(contentMode: .fit)
                .blur(radius: blurAmount)
            
            ScrollView{
                Spacer(minLength: 50)
                VStack(alignment: .leading){
                    Button("X"){
                        isPresentedPodcast = false
                    }
                    .padding(.horizontal,10)
                    .padding(.vertical,4)
                    .foregroundColor(.white)
                    .background(Color.yellow)
                    .cornerRadius(30)
                    .font(.system(size: 25))
                    
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
                        Text("Discusión").foregroundColor(Color("Text"))
                            .font(.custom(
                                "SofiaSans",
                                size: 18,
                                relativeTo: .title))
                    }.padding(20)
                    
                    
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
         
        PostCardPodcast(model: Post(id: "1",Thumbnail: "https://baudoap.com/wp-content/uploads/2023/01/GUERRILLERO-IMPASIBLE.jpg",Thumbnail2:  "https://baudoap.com/wp-content/uploads/2023/01/GUERRILLERO-IMPASIBLE.jpg", Author: "BaudoAP", Location: "Triguba,Choco", MainMediaUrl: "https://baudoap.com/wp-content/uploads/2022/12/Audio-3.mp3", Typo: "Imagen", Description: "Esta es una breve descripcion de contenido de Podcast para pruebas en el postCardPodcast y para solo visualizar como se veria el texto en las cartas del home", Category: "Medio Ambiente",Title: "Los rastros del cambio climatico",CreationDate: "23/Marzo/2023"))
        
    }
}



