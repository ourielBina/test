//
//  testApp.swift
//  test
//
//  Created by bina dev on 20/11/2023.
//

import SwiftUI

@main
struct testApp: App {
    @StateObject var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environmentObject(viewModel)
            FaceIdView()
        }
    }
    //branche test
    //deuxieme changement
    // troisieme changement 
}
