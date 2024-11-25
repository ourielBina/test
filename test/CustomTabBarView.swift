//
//  CustomTabBarView.swift
//  test
//
//  Created by bina dev on 01/04/2024.
//

import SwiftUI

struct CustomTabBarView: View {
    @EnvironmentObject var viewModel :ViewModel
    @State private var selectedPage = 1
    var body: some View {
        VStack {
            switch selectedPage {
            case 1:
                FirstView()
            case 2:
                SecondView()
            case 3:
                ThirdView()
            case 4:
                ListView()
            default:
                Text("Unknown Page")
            }
            Spacer()
            HStack {
                Spacer()
                TabBarButton(systemName: "person.text.rectangle", text: "התעודה שלי", index: 1, selectedPage: $selectedPage)
                Spacer()
                TabBarButton(systemName: "qrcode.viewfinder", text: "אימות", index: 2, selectedPage: $selectedPage)
                Spacer()
                TabBarButton(systemName: "menucard", text: "דרכון", index: 3, selectedPage: $selectedPage)
                Spacer()
                TabBarButton(systemName: "gearshape.fill", text: "הגדרות", index: 4, selectedPage: $selectedPage)
                Spacer()
            }.background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color.white)
                    .shadow(color: Color.black.opacity(0.4), radius: 5, x: 0, y: 5)
            )
            .padding(.top)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    CustomTabBarView()
        .environmentObject(ViewModel())
}
struct TabBarButton: View {
    let systemName: String
    let text: String
    let index: Int
    @Binding var selectedPage: Int
    
    var body: some View {
        Button(action: {
            selectedPage = index
        }) {
            VStack {
                Image(systemName: systemName)
                    .font(.system(size: 24))
                Text(text)
                    .font(.system(size: 12))
            }
            .foregroundColor(selectedPage == index ? .blue : .gray)
        }.padding()
    }
}
