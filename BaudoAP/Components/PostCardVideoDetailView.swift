//
//  PostCardVideoDetailView.swift
//  BaudoAP
//
//  Created by Codez on 22/03/23.
//

import SwiftUI
import SDWebImageSwiftUI
import AVKit


struct PostCardVideoDetailView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var contentVideo = ContentViewModelVideo()
    
    var model: Post
    
//    @Binding var isPresentedVideo: Bool
    
    var body: some View {
        
                ScrollViewReader { reader in
                    ScrollView{
                        
                        
        
                        ZStack(alignment: .topTrailing){
        
                          let URLS: String = model.MainMediaUrl
        
                            let player = AVPlayer(url: URL(string: URLS)!)
        
                            VideoPlayer(player: player)
                                .aspectRatio(9/16, contentMode: .fit)
                                .onAppear(){
                                    player.play()
                                    print("OnAppear triggered")
                                }
                                .onDisappear(){
                                    player.pause()
                                    print("OnDisappear triggered")
                                }
        
        
        //                        .onAppear(){
        //                            player.play()
        //            //                contentVideo.fetchNewComments(postId: model.id ?? "")
        //                        }
        //                        .onDisappear(){
        //                            player.pause()
        //            //                contentVideo.stopListener()
        //                        }
        
                            //                    .frame(width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height)
                            //                    .frame(width:UIScreen.main.bounds.width,height: .infinity)
        //
        
                            Image("BaudoVideo").resizable().frame(width:30,height: 60).padding(.top,70).padding(.trailing,10)
        
                            Button(action: {
                                withAnimation(.easeInOut(duration: 100)){
                                    reader.scrollTo("comments", anchor: .top)
                                }
        
        
                            }, label: {
                                Image(systemName: "list.bullet.rectangle")
                                    .padding(5)
                                    .padding(.vertical,1)
                                    .foregroundColor(Color("Yellow"))
                                    .background(Color.black)
                                    .overlay(RoundedRectangle(cornerRadius: 30)
                                                                .stroke(Color("Buttons"),
                                                                        lineWidth: 1))
                                    .cornerRadius(20)
                                    .font(.system(size: 30))
                                    .padding(.leading,10)
                            }).padding(.top,150)
        
        
        
                        }
        
                        VStack(alignment: .leading,spacing: 5){
                            HStack{
                                Spacer()
                            }
        
                            Text(model.Location).font(.custom("SofiaSans-Bold",size: 22,relativeTo: .title3)).multilineTextAlignment(.leading)
                            Text(model.Description)
                                .font(.custom("SofiaSans-Regular",size: 15,relativeTo: .body))
                                .multilineTextAlignment(.leading)
                            Text("Author: \(model.Author)")
                                .padding(.top,3)
                                .font(.custom("SofiaSans-Bold",size: 13,relativeTo: .caption))
        
        //                    Image("Lines")
        //                        .resizable()
        //                        .aspectRatio(contentMode: .fill)
        
                            Spacer()
                            Spacer()
        
                            Text("Comentarios").padding(.top,50).font(.custom("SofiaSans-Bold",size: 28,relativeTo: .title)).id("comments")
                            VStack(alignment: .leading){
                                HStack {
                                    Spacer()
                                }
          
        
                                ForEach(contentVideo.comments){ comment in
                                    HStack{
                                        Image(systemName: "person.circle")
                                            .resizable()
                                                                    .border(Color.accentColor, width: 4)
                                            .frame(width: 40,height: 40,alignment: .center)
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
                            .padding(20)
        
                    }
        //            .border(Color.red, width: 3)
        
                }.navigationBarBackButtonHidden(true)
                .ignoresSafeArea()
                .overlay(
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
//                        player.pause()
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
                    }).padding(.top,50), alignment: .topLeading
                )
        
                VStack(alignment: .leading){
                    HStack{
                        Image(systemName: "person.circle")
                            .resizable()
                            .foregroundColor(Color("Buttons"))
                            .frame(width: 40,height: 40,alignment: .center)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .padding(2)
                            .cornerRadius(20)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color("Buttons"), lineWidth: 1)
                                )
                        TextField("Agregar comentario",text: $contentVideo.commentText)
                            .foregroundColor(Color("Text"))
                            .padding(10)
                            .background(Color("BackgroundCards"))
                            .cornerRadius(19)
                        Button{
                            contentVideo.pushComment(postId: model.id ?? "")
                            print("Pusshed Comment YEYYYY",model.id ?? "")
                            
                        } label: {
                            Text("Enviar")
                        }
                            .buttonStyle(.borderedProminent)
                    }
                    .padding(.bottom,5)
                    .padding(.horizontal,10)
        
                }
            }
    }
    
    
    struct PostCardVideoDetailView_Previews: PreviewProvider {
        static var previews: some View {
            PostCardVideoDetailView(model: Post(Thumbnail: "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Videos%2FScreenshot%202023-03-23%20at%2011.33.20%20PM.png?alt=media&token=3e857497-6146-46c5-889d-fa55a44abc05",Thumbnail2:  "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Imagenes%2FThumb1.png?alt=media&token=2bf3ad6b-51b2-4727-9d80-29755377c5c1", Author: "BaudoAP", Location: "Triguba,Choco", MainMediaUrl: "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Videos%2FCopia%20de%20CHAGRA%201.mp4?alt=media&token=fc041a3d-8c5b-4fcc-86ad-954b4df28ee1", Typo: "Video", Description: "Esta es una breve descripcion de contenido de imagen para pruebas en el postCardImage y para solo visualizar coo se veria el texto en las cartas del home", Category: "Medio Ambiente",Title: "Title Video Prueba",CreationDate: "23/Marzo/2023"))
        }
    }
