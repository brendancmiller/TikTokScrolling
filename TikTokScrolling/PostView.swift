//
//  SwiftUIView.swift
//  TiktokScrolling
//
//  Created by Brendan Miller on 2025-11-05.
//

import SwiftUI
import AVKit

struct PostView: View {
    let videoFileName: String
    let title: String
    @State private var player: AVPlayer?
    
    var body: some View {
        ZStack {
            // Video player
            if let player = player {
                VideoPlayer(player: player)
                    .containerRelativeFrame([.horizontal, .vertical])
                    .ignoresSafeArea()
            } else {
                Rectangle()
                    .fill(Color.blue.opacity(0.6))
                    .containerRelativeFrame([.horizontal, .vertical])
            }
            
            // Overlay content
            VStack {
                Spacer()
                Text(title)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                    .padding()
            }
        }
        .onAppear {
            setupPlayer()
        }
        .onDisappear {
            player?.pause()
        }
    }
    
    private func setupPlayer() {
        guard let videoURL = Bundle.main.url(forResource: videoFileName, withExtension: "mp4") else {
            print("Video file not found: \(videoFileName).mp4")
            return
        }
        
        player = AVPlayer(url: videoURL)
        player?.play()
        
        // Loop the video
        NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: player?.currentItem,
            queue: .main
        ) { _ in
            player?.seek(to: .zero)
            player?.play()
        }
    }
}

#Preview {
    PostView(videoFileName: "sample", title: "Sample Video")
}
