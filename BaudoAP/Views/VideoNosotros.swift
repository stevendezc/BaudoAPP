//
//  VideoNosotros.swift
//  BaudoAP
//
//  Created by Codez on 1/04/23.
//

import SwiftUI
import WebKit

struct YoutubePlayer: UIViewRepresentable {
    var videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else {
            return
        }
        let request = URLRequest(url: youtubeURL)
        uiView.load(request)
    }
}

struct VideoNosotros: View {
    var body: some View {
        
        VStack {
            HStack{
                Spacer()
            }
            YoutubePlayer(videoID: "vD7gBZ4oRWM").cornerRadius(30)
                .frame(height: 300).padding(10)
            
            VStack(alignment: .leading){
                Text("HACEMOS PERIODISMO QUE CONECTA COMUNIDADES").multilineTextAlignment(.leading).font(.custom("SofiaSans-Bold",size: 20,relativeTo: .title)).padding(.bottom,5)
                Text("Que se asume a sí mismo como un actor para la transformación social a través de una investigación comprometida y una comunicación innovadora para aportar a la construcción de una sociedad más justa.")
                    .multilineTextAlignment(.leading)
                    .font(.custom("SofiaSans-Regular",size: 15,relativeTo: .body))
            }.padding(20)
            
            Spacer()
            
        }
        
        
    }
}
struct VideoNosotros_Previews: PreviewProvider {
    static var previews: some View {
        VideoNosotros()
    }
}
