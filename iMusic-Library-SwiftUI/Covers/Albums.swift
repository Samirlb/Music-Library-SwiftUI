import Foundation

class Albums {
    private var albums: [Album] = []

    init() {
        self.createAlbums()
    }
    
    private func createAlbums() {
        let albumDetails = [
            (name: AlbumName.wawandcoPlaylist, image: AlbumImage.firstCover, genre: AlbumGenre.pop, song: AlbumSong.wawandcoPlaylist),
            (name: AlbumName.newSongs, image: AlbumImage.secondCover, genre: AlbumGenre.reggaeton, song: AlbumSong.newSongs),
            (name: AlbumName.global50, image: AlbumImage.thirdCover, genre: AlbumGenre.rock, song: AlbumSong.global50),
            (name: AlbumName.topGlobal, image: AlbumImage.fourthCover, genre: AlbumGenre.hipHop, song: AlbumSong.topGlobal),
            (name: AlbumName.oldSoftRock, image: AlbumImage.fifthCover, genre: AlbumGenre.softRock, song: AlbumSong.oldSoftRock)
        ]

        for detail in albumDetails {
            let album = self.createAlbum(name: detail.name, image: detail.image, genre: detail.genre)
            self.setSongs(album, song: detail.song)
            self.addAlbum(album)
        }
    }
    
    private func createAlbum(name: AlbumName, image: AlbumImage, genre: AlbumGenre) -> Album {
        let album = Album()
        album.updateName(name.rawValue)
        album.updateImageName(image.rawValue)
        album.updateGenre(genre.rawValue)
        album.updateYear("2024")
        album.updateArtist("Wawandco")
        return album
    }
    
    private func addAlbum(_ album: Album) {
        if !self.albums.contains(where: { $0.name == album.name }) {
            self.albums.append(album)
        }
    }
    
    private func setSongs(_ album: Album, song: AlbumSong) {
        album.updateSong(song)
    }
    
    func getAllAlbums() -> [Album] {
        return self.albums
    }
    
    func getPhotos() -> [String] {
        return self.albums.map{ $0.imageName }
    }
}
