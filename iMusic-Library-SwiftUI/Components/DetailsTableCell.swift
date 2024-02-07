import SwiftUI

struct DetailsTableCell: View {
    var title: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text(description + " ")
                .foregroundColor(Color("descriptionColor"))
            Rectangle()
                .fill(Color.secondary)
                .frame(height: 0.1)
        }
    }
}

struct DetailsTableCellPreview: PreviewProvider {
    static var previews: some View {
        DetailsTableCell(title: "Test", description: "Test")
    }
}
