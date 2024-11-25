//
//  View2.swift
//  test
//
//  Created by bina dev on 17/12/2023.
//

import SwiftUI

struct SecondView: View {
    @EnvironmentObject var viewModel :ViewModel
    @State private var selectedPage = 1
    var body: some View {
        
            VStack {
                Image("img")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("vous etes a la vue \(viewModel.indexPage+1) ")
                NavigationLink("Aller à la Vue \(viewModel.indexPage+2)",value:3)
            }
            .navigationBarTitle("Deuxième Vue")
            .onDisappear{
                viewModel.cropImage = viewModel.cropImage(image: UIImage(named: "img") ?? UIImage(), x: 115, y: 164, width: 211, height: 52) ?? UIImage()
            }
}
}

#Preview {
    SecondView( )
        .environmentObject(ViewModel())
}
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
}
