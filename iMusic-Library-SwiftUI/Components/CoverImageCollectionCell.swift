import SwiftUI

struct CoverImageCollectionCell: View {
    @Binding var currentAlbum: Album
    let album: Album
    
    var body: some View {
        Image(album.imageName)
            .resizable(resizingMode: .stretch)
            .frame(width: 128, height: 128)
            .onTapGesture {
                self.currentAlbum = album
            }
    }
}

struct CoverImageCellPreview: PreviewProvider {
    @State static var currentAlbum: Album = Albums().getAllAlbums().first ?? Album()
    static var previews: some View {
        CoverImageCollectionCell(currentAlbum: $currentAlbum, album: Album())
    }
}
