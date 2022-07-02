//
//  TestStateVC.swift
//  Mixo
//
//  Created by Weng on 7/1/22.
//  Copyright © 2022 Sean Hall. All rights reserved.
//

import SwiftUI

class Store: ObservableObject {
    @Published var count: Int = 0;

    func registerRequest() {
        count = count + 1;
    }
}

struct TestStateVC: View {
    @ObservedObject var myStore: Store = Store();
    
    var body: some View {
        VStack {
            Text(String(myStore.count))
                .frame(maxHeight:100, alignment: .topLeading)
                .padding([.top], 50)
            Spacer()
            Button(action: { myStore.registerRequest() }) {
                    Text("Increment")
            }
            .frame(maxWidth:100, maxHeight:50)
            .padding([.top, .bottom], 50)
        }
        
    }
}

//struct TestStateVC_Previews: PreviewProvider {
//    static var previews: some View {
//        TestStateVC()
//    }
//}
