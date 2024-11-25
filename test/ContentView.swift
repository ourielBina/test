//
//  ContentView.swift
//  test
//
//  Created by bina dev on 20/11/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel :ViewModel
    var body: some View {
        FirstView()
    }
}
//troisieme changement
#Preview {
    ContentView()
        .environmentObject(ViewModel())
}
