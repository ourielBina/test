//
//  ThirdView.swift
//  test
//
//  Created by bina dev on 17/12/2023.
//

import SwiftUI

struct ThirdView: View {
    @EnvironmentObject var viewModel :ViewModel
    var body: some View {
        VStack {
            Image(uiImage: viewModel.cropImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Vue 3")
            Button(action: {
                
                viewModel.path = NavigationPath()
            }) {
                Text("Revenir à la Première Vue")
            }
        }
        .navigationBarTitle("Troisième Vue")
        .onAppear{
            viewModel.cropImage = viewModel.cropImage(image: UIImage(named: "img3") ?? UIImage(), x: 1198, y: 393, width: 956, height: 1496) ?? UIImage()
        }
    }
}
#Preview {
    ThirdView()
        .environmentObject(ViewModel())
}
