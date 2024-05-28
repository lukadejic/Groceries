
import SwiftUI

struct ProductDetails: View {
    let product : Product
    @Binding var isShowDetail : Bool
    @State var name : String = "Product Details"
    
    var body: some View {
        VStack {
            HStack{
                Text(name)
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                Button{
                    withAnimation {
                        isShowDetail.toggle()
                    }
                }label: {
                    Image(isShowDetail ? "detail_open": "next")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                        .padding(15)
                }
                .foregroundColor(Color.primaryText)
                
            }
            if(isShowDetail){
                
                NutritionRow(name: "Discount Percentage", value: String(product.discountPercentage))
                
                Divider()
                
                NutritionRow(name: "Rating", value: String(product.rating))
                
                Divider()
                
                NutritionRow(name: "Stock",value: String(Int(product.stock)))
                
                Divider()
                
                NutritionRow(name: "Brand",value: product.brand)
            }
            Divider()
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    ProductDetails(product: MockData.sampleProduct, isShowDetail: .constant(true))
}
