import SwiftUI
import AVKit

struct PlayerView: View {
    @State private var buttonImage: String = "play"
    @State private var player: AVAudioPlayer?
    @Binding var album: Album
    
    var body: some View {
        VStack {
            Divider()
            HStack {
                Image(album.imageName)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.leading, 16)
                VStack(alignment: .leading) {
                    Text(album.artist)
                        .font(.system(size: 17))
                        .padding([.bottom])
                    Text(album.name)
                        .font(.system(size: 20))
                }
                Spacer()
                Button(action: {
                    guard let player = self.player else {
                        self.initializePlayer()
                        return
                    }
                    self.togglePlayer(player: player)
                }) {
                    Image(systemName: buttonImage)
                        .resizable(resizingMode: .tile)
                        .frame(width: 20, height: 30)
                        .foregroundColor(Color("descriptionColor"))
                }
                .padding(.trailing, 16)
            }
            .frame(height: 132)
            .background(Color.clear)
        }
        .onChange(of: album.imageName) { _ , _ in
            self.initializePlayer()
            self.buttonImage = "pause"
        }
    }
    

    private func initializePlayer() {
        let currentAlbum = self.album
        if currentAlbum.name.isEmpty {
            return
        }

        let soundFileURL = self.getCurrentSong(album: currentAlbum)
        do {
            self.player?.stop()
            self.player = try AVAudioPlayer(contentsOf: soundFileURL)
            self.player?.play()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func getCurrentSong(album: Album) -> URL {
        let song = album.song.rawValue
        guard let soundFileURL = Bundle.main.url(forResource: song, withExtension: "flac") else {
            return URL(fileURLWithPath: "")
        }
        return soundFileURL
    }
    
    private func togglePlayer(player: AVAudioPlayer) {
        if player.isPlaying {
            player.pause()
            self.buttonImage = "play"
            return
        }
        player.play()
        self.buttonImage = "pause"
    }
}

struct PlayerViewPreview: PreviewProvider {
    @State static var album: Album = Albums().getAllAlbums().first ?? Album()
    static var previews: some View {
        PlayerView(album: $album)
    }
}
