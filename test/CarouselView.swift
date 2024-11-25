//
//  CarouselView.swift
//  test
//
//  Created by bina dev on 01/05/2024.
//

import SwiftUI

struct CarouselView: View {
    @State private var currentIndex: Int = 0
    @GestureState private var dragOffset: CGFloat = 0
    private let images: [String] = ["img","img2","img3"]
    var body: some View {
        VStack{
            Text("האם להשתמש בתמונה")
                .fontWeight(.bold)
            Text("באפשרותך לצלם עוד 2 תמונות נוספות")
                .font(.system(size: 13))
            Spacer()
            VStack {
                ZStack {
                    ForEach(0..<images.count, id: \.self) { index in
                        if currentIndex == index{
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.blue, lineWidth: 2)
                                .frame(width: 250,height: 350)
                                .scaleEffect(1.2)
                        }
                        Image (images [index])
                            .frame(width: 250,height: 350)
                            .cornerRadius (25)
                            .opacity(currentIndex == index ? 1.0 : 0.5)
                            .scaleEffect (currentIndex == index ? 1.2 : 1)
                            .offset(x: CGFloat (index - currentIndex) * 300,y:0)
                    }
                }
                HStack{
                    Button(action:{
                        withAnimation{
                            currentIndex = max(0, currentIndex - 1)
                        }
                    }){
                        Image(systemName: "arrow.left")
                    }.padding()
                    ForEach(0..<images.count, id: \.self) { index in
                        Circle().fill(index == currentIndex ? Color.HexToColor(hexString: "#5C5959") : Color.HexToColor(hexString: "#D9D9D9")).frame(width: 10,height: 10)
                    }
                    Button(action:{
                        withAnimation{
                            currentIndex = min(images.count - 1, currentIndex + 1)
                        }
                    }){
                        Image(systemName: "arrow.right")
                    }.padding()
                }.padding(.top)
                    .offset(y:50)
            }
            Spacer()
            Button(action: {
                
            }) {
                Text("השתמש בתמונה")
                    .fontWeight(.bold)
                    .frame(width: 300,height: 50)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Button(action: {
                
            }){
                Text("נסיון נוסף")
                    .foregroundColor(.black)
                    .padding()
            }
        }
    }
}
#Preview {
    CarouselView()
}
extension Color{
    static func HexToColor(hexString: String) -> Color {
        // Convert hex string to an integer
        var hexInt: UInt64 = 0
        let scanner: Scanner = Scanner(string: hexString)
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        scanner.scanHexInt64(&hexInt)
        
        let red = CGFloat((hexInt & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexInt & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexInt & 0xff) >> 0) / 255.0
        
        // Create color object, specifying alpha as well
        let color = Color(UIColor(red: red, green: green, blue: blue, alpha: 1.0))
        return color
    }

}
