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
import AVKit


enum Utility {
  static func formatSecondsToHMS(_ seconds: TimeInterval) -> String {
    let secondsInt:Int = Int(seconds.rounded(.towardZero))
    
    let dh: Int = (secondsInt/3600)
    let dm: Int = (secondsInt - (dh*3600))/60
    let ds: Int = secondsInt - (dh*3600) - (dm*60)
    
    let hs = "\(dh > 0 ? "\(dh):" : "")"
    let ms = "\(dm<10 ? "0" : "")\(dm):"
    let s = "\(ds<10 ? "0" : "")\(ds)"
    
    return hs + ms + s
  }
}

struct PostCardPodcastDetail: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var contentPodcast = ContentViewModelPodcast()
    
//    @State var audioPlayer: AVPlayer! // Your audio player object
    
    @State private var audioPlayer = AVPlayer(url: URL(string: "https://baudoap.com/wp-content/uploads/2021/04/moto2.mp3")!)
    
//    @State var audioPlayer = AVPlayer()
//
//    @State var playerItem = AVPlayerItem(url: URL(string: "https://baudoap.com/wp-content/uploads/2022/12/Audio-3.mp3")!)
    
    
    @State var isPlaying : Bool = true
    
    var model: Post
    
    @State private var blurAmount = 0.0
    
    @State var value: Double = 0.0
    
//    @State private var currentTimeAudio: Double = 0.0
    
    
    @State private var duration: Double = 0.0
    
    @State private var isEditing: Bool = false
    
//    @State private var currentTime: TimeInterval = 0
    
    
    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    
    
    var body: some View {
        
        //        ZStack(alignment: .topLeading){
        //
        //            WebImage(url: URL(string: model.Thumbnail2))
        //                .resizable()
        //                .frame(width:UIScreen.main.bounds.width,
        //                       height:UIScreen.main.bounds.height)
        //                .aspectRatio(contentMode: .fit)
        //                .blur(radius: blurAmount)
        
        
        ScrollView{
            Spacer(minLength: 90)
            
            VStack(alignment: .leading){
                
                
                HStack{
                    
                    WebImage(url: URL(string: model.thumbnail))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:100)
                    //                .border(Color.red, width: 3)
                    
                    VStack(alignment: .leading,spacing: 5) {
                        HStack{
                            Text(model.title)
                                .font(.custom("SofiaSans-Bold", size: 18,relativeTo: .title))
                                .fontWeight(.heavy)
                            Spacer()
                            Button {
                                playPause()
                                print("Button Pressed")
                                print(audioPlayer.currentTime().seconds)
                            } label: {
                                if isPlaying {
                                    Image("Pause")
                                } else {
                                    Image("Play")
                                }
                                
                            }
                            .padding(.top,-60)
                            .foregroundColor(Color("Buttons"))
                            
                        }
                        
                        Text(model.creationDateString)
                            .font(.custom("SofiaSans-Medium",size: 14,relativeTo: .caption))
                       
                            
                    }.foregroundColor(Color("Text"))
                        .multilineTextAlignment(.leading)
                    
                }

                Slider(value: $value, in: 0...duration) { editing in
                    print("editing",editing)
                    isEditing = editing

                    if !editing {
//                      audioPlayer.currentTime = value
//                        audioPlayer.currentItem?.currentTime() = value
                        print("new value",value)
                    }
                }
                
                HStack{
                    Text(Utility.formatSecondsToHMS(value))
                        .font(.custom("SofiaSans-Regular",size: 12,relativeTo: .caption))
//                    Text("\(value)")
                    Spacer()
//                    Text(duration)
                    Text(Utility.formatSecondsToHMS(duration))
                        .font(.custom("SofiaSans-Regular",size: 12,relativeTo: .caption))
                }
                Spacer(minLength: 20)
                Text(model.description).font(.caption)
                    .font(.custom("SofiaSans-Regular",size: 18,relativeTo: .body))
            }
            
            .padding(20)
            .background(Color("BackgroundCards"))
            .cornerRadius(20)
            .padding(15)
            
            
            VStack{
                
                HStack{
                    Image("Iryvenir")
                    Spacer()
                    Text("Discusión").foregroundColor(Color("Text"))
                        .font(.custom("SofiaSans-Bold",size: 24,relativeTo: .title))
                    
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
            
        }
        
        .navigationBarBackButtonHidden(true)
        .background(
            WebImage(url: URL(string: model.thumbnail2))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(-5)
                .frame(width:UIScreen.main.bounds.width,
                       height:UIScreen.main.bounds.height)
                .blur(radius: blurAmount)
        )
        .overlay(
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("←")
                    .padding(.horizontal,5)
                    .padding(.vertical,1)
                    .foregroundColor(Color("Yellow"))
                    .background(Color.black)
                    .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(Color("Buttons"),
                                lineWidth: 1))
                    .cornerRadius(30)
                    .font(.system(size: 30))
                    .padding(.leading,10)
            }).padding(.top,60), alignment: .topLeading
        )
        .ignoresSafeArea()
        
        //                    .padding(10)
        //                    .padding(.top,75)
        
        //        }
        
        HStack{
            Image(systemName: "person.circle")
                .resizable()
            //                            .border(Color.accentColor, width: 4)
                .frame(width: 40,height: 40,alignment: .center)
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
            .padding(10)
            .background(Color("BackgroundCards"))
            .cornerRadius(19)
            Button{
                contentPodcast.pushComment(postId: model.id ?? "")
                
                print("Pusshed Comment YEYYYY",model.id ?? "")
            } label: {
                Text("Enviar")
            }
            .buttonStyle(.borderedProminent)
        }
        
        .padding(.vertical,5)
        .padding(.horizontal,10)
        .background(Color("BackgroundColor"))
        .onAppear(){
            contentPodcast.fetchNewComments(postId: model.id ?? "")
            Play()
            
//            audioPlayer.addPeriodicTimeObserver(forInterval: CMTime(seconds: 0.1, preferredTimescale: CMTimeScale(NSEC_PER_SEC)), queue: DispatchQueue.main) { [self] time in
//                //                guard let self =  else { return }
//
//                value = time.seconds
//                currentTime = value
//
//                if currentTime == duration {
//                    print("finished playing")
//                    audioPlayer.seek(to: .zero)
//                    audioPlayer.pause()
//                    self.isPlaying.toggle()
//                    currentTime = 0.0
////                    audioPlayer.play()
//                    value = 0.0
//                }
                
//               let currentTimeAudio = audioPlayer.currentTime
//                print("currentTimeAudio", currentTimeAudio)
//                let audioDurationSecondscurrentTime = CMTimeGetSeconds(currentTimeAudio())
//                print("audioDuraSecCuTime",audioDurationSecondscurrentTime)
//                value = audioDurationSecondscurrentTime
//                print(value)
            }
            
//        }
        .onReceive(timer){ (_) in
            
           
//                        let currentTimeAudio = audioPlayer.currentTime
//            //            print("currentTimeAudio", currentTimeAudio)
//                        let audioDurationSecondscurrentTime = CMTimeGetSeconds(currentTimeAudio())
//            //            print("audioDuraSecCuTime",audioDurationSecondscurrentTime)
//                        value = audioDurationSecondscurrentTime
            
            if isPlaying {
                value = (CMTimeGetSeconds(audioPlayer.currentTime()))
                
                if value.rounded() == duration.rounded() {
                    print("finished playing")
                    audioPlayer.seek(to: .zero)
                    audioPlayer.pause()
                    self.isPlaying.toggle()
//                            currentTime = 0.0
    //                    audioPlayer.play()
                    value = 0.0
                } else {
                    print("Value = ",value)
                }
            } else {
                isPlaying = false
            }
                        
                       
           
            
        }
        .onDisappear(){
            contentPodcast.stopListener()
        }
        
    }
            
        
        
        
    func Play(){
//            let storage = Storage.storage().reference(forURL: self.model.main_media)
//            storage.downloadURL { (url, error) in
//                if error != nil {
//                    print(error ?? "Error")
//                } else {
//                    do {
//                        try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
//                    }
//                    catch{
//                        //                    Report for an error
//                    }
                    
                    
//                    audioPlayer = AVPlayer(url: url!)
                    
                    
            let asset = AVURLAsset(url: URL(string: "https://baudoap.com/wp-content/uploads/2021/04/moto2.mp3")!)
//            let audioDuration = asset.duration
        
            
//            let audioDurationSeconds = CMTimeGetSeconds(audioDuration)
        
                    audioPlayer.play()
                    duration = CMTimeGetSeconds(asset.duration)
                    print("duration ", duration)
                }
//            }
//        }
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
//            PostCardPodcastDetail()
        }
    }
}



