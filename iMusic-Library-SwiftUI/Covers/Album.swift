import Foundation

class Album {
    private(set) var name: String = ""
    private(set) var imageName: String = "no_songs"
    private(set) var artist: String = ""
    private(set) var genre: String = ""
    private(set) var year: String = ""
    private(set) var song: AlbumSong = .none
    
    func updateName(_ name: String) {
        self.name = name
    }
    
    func updateImageName(_ imageName: String) {
        self.imageName = imageName
    }
    
    func updateArtist(_ artist: String) {
        self.artist = artist
    }
    
    func updateGenre(_ genre: String) {
        self.genre = genre
    }
    
    func updateYear(_ year: String) {
        self.year = year
    }
    
    func updateSong(_ song: AlbumSong) {
        self.song = song
    }
    
    func getRowDetail(position: Int) -> RowDetail {
        return self.getRowDetails()[position - 1]
    }
    
    func getRowDetails() -> [RowDetail] {
        return [
            RowDetail(title: .artist, detail: self.artist),
            RowDetail(title: .album, detail: self.name),
            RowDetail(title: .genre, detail: self.genre),
            RowDetail(title: .year, detail: self.year)
        ]
    }
}
