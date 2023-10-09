import SwiftUI

struct DetailView: View {
    let cellModel: CellModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image(cellModel.imageURL)
                .resizable()
                .frame(height: 180)
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .circular))
            
            Text(cellModel.title)
                .font(.title)
                .bold()
            
            Text(cellModel.description)
            
            ForEach(cellModel.infos, id: \.id) { info in
                HStack {
                    Image(systemName: info.iconName)
                        .foregroundStyle(.orange)
                    Text(info.description)
                }
            }
            
            Text(cellModel.price.currencyFormatting())
                .font(.title2)
                .bold()
            
            Spacer()
                
            Button {
                if let url = URL(string: cellModel.contact) {
                    UIApplication.shared.open(url)
                }
            } label: {
                Text("Contato do Guia")
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.black)
            }
            .buttonStyle(.borderedProminent)
            .tint(.orange)
            .controlSize(.large)
            .font(.headline)
            .padding([.bottom], 24)
        }
        .padding(.horizontal, 16)
    }
}
