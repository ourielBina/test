//
//  TimerView.swift
//  test
//
//  Created by bina dev on 10/01/2024.
//

import SwiftUI

struct TimerView: View {
    @State var task: Task<(), Never>? = nil
    @State var tasks: [Task<(), Never>] = []
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var time = 0
    @State var isActive = true
    var body: some View {
        Text("time: \(time)")
            .onReceive(timer){ _ in
                updateTime()
            }
    }
    
    func updateTime(){
        guard isActive else{return}
        time += 1
        print("TIME:\(time)")
        task = Task{
            do{
//                let temp = try await APIRequest.shared.makePostRequest(params: [UIImage(named: "img3")?.toBase64String() ?? ""], requestType: .CREATE_TEMPLATE)
//                print("\(temp) !!!!\(time)")
//                if temp != nil{
//                    isActive = false
//                    endTimer()
//                }
            }catch{}
        }
        if time  == 10{
            isActive = false
            endTimer()
        }
    }
     func endTimer(){
        for task in tasks {
            task.cancel()
        }
        tasks.removeAll()
    }
}

#Preview {
    TimerView()
}
extension UIImage{
    func toBase64String() -> String {
        
        guard let imageData = self.jpegData(compressionQuality: 1)
        else {
            return ""
        }
        
        let str64 = imageData.base64EncodedString()
        
        return str64
        //        return "data:image/jpg;base64,\(str64)"
    }
}
