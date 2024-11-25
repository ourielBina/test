//
//  VIewModel.swift
//  test
//
//  Created by bina dev on 17/12/2023.
//

import Foundation
import SwiftUI

final class ViewModel: ObservableObject {
    @Published var indexPage = 1
    @Published var path = NavigationPath()
    @Published var cropImage = UIImage()
    func cropImage(image: UIImage, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> UIImage? {
        let xDiff = CGFloat( width*0.25)
        let yDiff = CGFloat( height*0.25)
        let rect = CGRect(x: x-xDiff, y: y-yDiff, width: width*1.5, height: height*1.5)
        
        if let croppedCGImage = image.cgImage?.cropping(to: rect) {
            return UIImage(cgImage: croppedCGImage, scale: image.scale, orientation: image.imageOrientation)
        } else {
            return nil
        }
    }
}
extension Binding where Value == String {
    func limit(_ lenght:Int)->Self{
        if self.wrappedValue.count > lenght{
            DispatchQueue.main.async {
                self.wrappedValue = String (self.wrappedValue.prefix(lenght))
            }
        }
        return self
    }
}
