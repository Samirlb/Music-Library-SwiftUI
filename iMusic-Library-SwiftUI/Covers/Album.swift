import Foundation

class Album {
    private(set) var id = UUID()
    private(set) var name: String = ""
    private(set) var imageName: String = ""
    private(set) var artist: String = ""
    private(set) var genre: String = ""
    private(set) var year: String = ""
    
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
