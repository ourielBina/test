//
//  TextFieldView.swift
//  test
//
//  Created by bina dev on 04/01/2024.
//

import SwiftUI

struct TextFieldView: View {
    enum Field: Hashable {
        case username
        case password
    }
    
    @State private var code = ""
    @State private var username = ""
    @State private var password = ""
    @FocusState private var focusedField: Field?
    @FocusState var focus:Bool?
    var body: some View {
        Form {
            TextField("Username", text: $username)
                .focused($focusedField, equals: .username)
            
            SecureField("Password", text: $password)
                .focused($focusedField, equals: .password)
            
            
            Button("Sign In") {
                if username.isEmpty {
                    focusedField = .username
                } else if password.isEmpty {
                    focusedField = .password
                } else {
                    //                    handleLogin(username, password)
                }
            }
        }
        Spacer()
        HStack{
            ZStack{
                TextField("",text: $code.limit(6))
                    .focused($focus,equals: true)
                    .padding()
                    .frame(width: 10)
                HStack {
                    ForEach(0 ..< 6) { index in
                        OTP(index: index)
                    }
                }.background(.white)
                
            }
        }.background(content:{
            //                TextField("allo",text: $code.limit(6))
        })
        .onAppear{
            focus = true
        }
        Spacer()
   }
    @ViewBuilder
    func OTP(index:Int)->some View {
        ZStack{
            if code.count > index{
                let startIndex = code.startIndex
                let charIndex = code.index(startIndex, offsetBy: index)
                let charToString = String(code[charIndex])
                Text(charToString)
            }else{
                Text(" ")
            }
        }.frame(width: 50, height: 50)
            .background(RoundedRectangle(cornerRadius: 8).stroke(Color(.systemGray), lineWidth: 2))
    }
}

#Preview {
    TextFieldView()
}
