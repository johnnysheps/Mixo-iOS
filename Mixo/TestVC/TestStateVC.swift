//
//  TestStateVC.swift
//  Mixo
//
//  Created by Weng on 7/1/22.
//  Copyright © 2022 Sean Hall. All rights reserved.
//

import SwiftUI

struct TestStateVC: View {
    var returnToUIKit: (() -> Void)?
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(maxHeight:100, alignment: .topLeading)
                .padding([.top], 50)
            Spacer()
            Button(action: self.returnToUIKit!) {
                Text(" <- Back")
                .foregroundColor(Color.gray)
                .opacity(0.5)
            }
        }
    }
    
    init(returnToUIKit:(()->Void)?) {
        self.returnToUIKit = returnToUIKit;
    } // init
}

//struct TestStateVC_Previews: PreviewProvider {
//    static var previews: some View {
//        TestStateVC()
//    }
//}
