import SwiftUI

struct LibraryContentView: View {
    @State var albums: [Album] = Albums().getAllAlbums()
    @State var currentAlbum: Album = Album()
    
    var body: some View {
        List {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(albums.indices, id: \.self) { index in
                        CoverImageCollectionCell(currentAlbum: $currentAlbum, album: albums[index])
                    }
                    
                }
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
            .listRowInsets(EdgeInsets())
            .padding()
                        
            ForEach(currentAlbum.getRowDetails(), id: \.self) { album in
                DetailsTableCell(title: album.title.rawValue, description: album.detail)
                
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        PlayerView(album: $currentAlbum)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryContentView()
    }
}
