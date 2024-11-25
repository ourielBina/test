//
//  FaceIdView.swift
//  test
//
//  Created by bina dev on 07/04/2024.
//

import SwiftUI
import LocalAuthentication

struct FaceIdView: View {
    @State private var isUnlocked = false
    @State private var showingAlert = false
    let context = LAContext()
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Bienvenue!")
            } else {
                Button(action: authenticate) {
                    Text("Déverrouiller")
                }
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Erreur d'authentification"), message: Text("Impossible de vérifier votre identité."), dismissButton: .default(Text("OK")))
        }
    }
    
    func authenticate() {
        var error: NSError?
        //pour le code
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "Pour accéder à cette fonctionnalité, veuillez vous authentifier."
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        isUnlocked = true
                    } else {
                        showingAlert = true
                    }
                }
            }
//            pour le face id
//            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
//                DispatchQueue.main.async {
//                    if success {
//                        isUnlocked = true
//                    } else {
//                        showingAlert = true
//                    }
//                }
//            }
        } else {
            showingAlert = true
        }
    }
}

#Preview {
    FaceIdView()
}
