import SwiftUI

struct LibraryContentView: View {
    @State var albums: [Album] = []
    @State var currentAlbum = 0
    
    var body: some View {
        List {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(albums.indices, id: \.self) { index in
                        CoverImageCollectionCell(imageName: albums[index].imageName, currentAlbum: $currentAlbum, index: index)
                    }
                    
                }
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
            .listRowInsets(EdgeInsets())
            .padding()
                        
            ForEach(albums[currentAlbum].getRowDetails(), id: \.self) { album in
                DetailsTableCell(title: album.title.rawValue, description: album.detail)
                
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryContentView(albums: Albums().getAllAlbums())
    }
}
