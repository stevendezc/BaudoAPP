import SwiftUI
import AVKit


struct Tester: View {
    @State private var currentTime: Double = 0
    @State private var player = AVPlayer(url: URL(string: "https://baudoap.com/wp-content/uploads/2022/12/Audio-3.mp3")!)
    
    var body: some View {
        VStack {
            Slider(value: $currentTime, in: 0...100)
                .padding()
            Button(action: {
                player.play()
            }, label: {
                Text("Play")
            })
            .padding()
        }
        .onAppear {
            player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 0.1, preferredTimescale: CMTimeScale(NSEC_PER_SEC)), queue: DispatchQueue.main) { [self] time in
//                guard let self =  else { return }
                self.currentTime = time.seconds
            }
        }
    }
}

struct Tester_Previews: PreviewProvider {
    static var previews: some View {
        Tester()
    }
}
