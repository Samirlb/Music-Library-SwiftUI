import Foundation

class Albums {
    private var albums: [Album] = []

    init() {
        self.createAlbums()
    }
    
    private func createAlbums() {
        let albumDetails = [
            (name: AlbumName.wawandcoPlaylist, image: AlbumImage.firstCover, genre: AlbumGenre.pop),
            (name: AlbumName.newSongs, image: AlbumImage.secondCover, genre: AlbumGenre.reggaeton),
            (name: AlbumName.globalViral, image: AlbumImage.thirdCover, genre: AlbumGenre.rock),
            (name: AlbumName.topGlobal, image: AlbumImage.fourthCover, genre: AlbumGenre.hipHop),
            (name: AlbumName.oldSoftRock, image: AlbumImage.fifthCover, genre: AlbumGenre.softRock)
        ]

        for detail in albumDetails {
            let album = self.createAlbum(name: detail.name, image: detail.image, genre: detail.genre)
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
    
    func addAlbum(_ album: Album) {
        if !self.albums.contains(where: { $0.name == album.name }) {
            self.albums.append(album)
        }
    }
    
    func getAllAlbums() -> [Album] {
        return self.albums
    }
    
    func getPhotos() -> [String] {
        return self.albums.map{ $0.imageName }
    }
}
