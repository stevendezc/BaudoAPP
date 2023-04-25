//import SwiftUI
//import AVFoundation
//
//
//
//struct ContentView: View {
//
//    let audioPlayer = AVAudioPlayer()
//
//    @State private var currentTime: TimeInterval = 0
//    @State private var isPlaying = false
//
//    var body: some View {
//        VStack {
//            Slider(value: $currentTime, in: 0...audioPlayer.duration)
//                .padding()
//
//            Button(action: {
//                if isPlaying {
//                    audioPlayer.pause()
//                } else {
//                    audioPlayer.play()
//                }
//                isPlaying.toggle()
//            }) {
//                Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 50, height: 50)
//            }
//        }
//        .onAppear {
//            let url = Bundle.main.url(forResource: "song", withExtension: "mp3")!
//            do {
//                audioPlayer = try AVAudioPlayer(contentsOf: url)
//            } catch {
//                print("Error loading audio file: \(error)")
//            }
//        }
//        .onReceive(Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()) { _ in
//            currentTime = audioPlayer.currentTime
//        }
//    }
//}
