//
//  QrView.swift
//  test
//
//  Created by bina dev on 20/02/2024.
//

import SwiftUI
import CoreImage.CIFilterBuiltins
struct QrView: View {
    @State private var isShowQRAlert = false
    @State private var opacity: Double = 0.0
    var body: some View {
        ZStack {
            Button("Show QR Code") {
                isShowQRAlert.toggle()
            }
            if isShowQRAlert{
                ZStack{
                    Rectangle() //opacity layer
                        .fill(Color.black)
                        .opacity(opacity) // Start with opacity 0
                        .frame(minWidth: 0, minHeight: 0, alignment: .center)
                        .edgesIgnoringSafeArea(.all)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 1.0)) {
                                self.opacity = 0.5
                            }
                        }
                        .onTapGesture {
                            isShowQRAlert.toggle()
                        }
                    QRCodeView()
                }
                
            }
        }
    }
}
struct QRCodeView: View {
    @State private var rectPosition = CGSize(width: 0, height:UIScreen.main.bounds.height)
    let shadowColor = Color(red: 0.153, green: 0.153, blue: 0.227, opacity: 0.2)
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .frame(width: 230, height: 230)
            .cornerRadius(18)
            .shadow(color: shadowColor, radius: 0, x: 0, y: 0)
            .shadow(color: shadowColor, radius: 12, x: 0, y: 6)
            .shadow(color: shadowColor, radius: 23, x: 0, y: 23)
            .shadow(color: shadowColor, radius: 30, x: 0, y: 51)
            .shadow(color: shadowColor, radius: 36, x: 0, y: 90)
            .overlay {
                VStack {
                    Image(uiImage: "ouriel_Bennathan_337927800_15/12/95".generateQRCode())
                        .resizable()
                        .interpolation(.none)
                        .frame(width: 180,height: 180)
                }
            }
            .offset(x: rectPosition.width, y: rectPosition.height)
            .onAppear {
                withAnimation(.spring()) {
                    self.rectPosition = .zero
                }
            }
    }
}
extension String{
    func generateQRCode()->UIImage{
        var filter = CIFilter.qrCodeGenerator()
        let data = Data(self.utf8)
        filter.setValue(data, forKey: "inputMessage")
        if let qrCodeImage = filter.outputImage{
            if let qrCodeCGImage = CIContext().createCGImage(qrCodeImage, from: qrCodeImage.extent){
                return UIImage(cgImage: qrCodeCGImage)
            }
        }
        return UIImage(systemName: "xmark") ?? UIImage()
    }
}
#Preview {
    QrView()
}
