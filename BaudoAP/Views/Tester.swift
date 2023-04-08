//
//  ContentView.swift
//  VideoPlayerTester
//
//  Created by Codez on 6/04/23.
//

import SwiftUI
import AVKit

struct Tester: View {
    var body: some View {
        VStack {
            let URLS: String = "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Videos%2FVideos%2F03.%20Champeta%20s.mp4?alt=media&token=1dfe1eed-9054-45fa-bdc9-bf002cd06de9"
            let player = AVPlayer(url: URL(string: URLS)!)

            VideoPlayer(player: player)
                .aspectRatio(9/16, contentMode: .fit)
                .onAppear(){
                    player.play()
                }
        }
        .padding()
    }
}

struct Tester_Previews: PreviewProvider {
    static var previews: some View {
        Tester()
    }
}
