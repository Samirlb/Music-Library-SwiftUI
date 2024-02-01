import SwiftUI

struct CoverImageCollectionCell: View {
    var imageName: String
    @Binding var currentAlbum: Int
    let index: Int
    
    var body: some View {
        Image(imageName)
            .resizable(resizingMode: .stretch)
            .frame(width: 128, height: 128)
            .onTapGesture {
                self.currentAlbum = self.index
            }
    }
}

struct CoverImageCellPreview: PreviewProvider {
    @State static var currentAlbum: Int = 0
    static var previews: some View {
        CoverImageCollectionCell(imageName: "firstCover", currentAlbum: $currentAlbum, index: 0)
    }
}
