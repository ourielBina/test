//
//  FirstView.swift
//  test
//
//  Created by bina dev on 17/01/2024.
//

import SwiftUI

struct FirstView: View {
    @EnvironmentObject var viewModel :ViewModel
    var body: some View {
        NavigationStack(path: $viewModel.path){
            VStack {
                Text("edit-profile")
                NavigationLink("Aller à la Vue \(viewModel.indexPage+1)",value:2)
            }
                    .navigationDestination(for: Int.self){ i in
                switch i{
                case 2:
                    SecondView()
                case 3:
                    ThirdView()
                default:
                    ContentView()
                }
            }
            .navigationBarTitle("Première Vue")
        }
    }
}

#Preview {
    FirstView().environmentObject(ViewModel())
}
