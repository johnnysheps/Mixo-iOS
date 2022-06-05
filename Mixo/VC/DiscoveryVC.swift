//
//  DiscoveryVC.swift
//  Mixo
//
//  Created by Weng on 6/4/22.
//  Copyright © 2022 Sean Hall. All rights reserved.
//

import SwiftUI


struct Row: View {
    let age: Int;
    var screenWidth: CGFloat;
    
    var body: some View {
        VStack(alignment:.leading, spacing:0) {

            HStack(alignment:.top, spacing:0) {
                Rectangle()
                    .fill(Color.red)
                    .frame(height: 130)
            
                Rectangle()
                    .fill(Color.blue)
                    .frame(height: 130)
            }.frame(width: self.screenWidth, height: 130)
            
            Image("loadingbg")
                    .resizable()
                    .frame(width: self.screenWidth, height: 10)
        
//            Rectangle()
//                .fill(Color.white)
//                .frame(width:self.screenWidth, height: 10)
//                .scaledToFill()
            // If re-enabling Rectangle for .overlay(), add the extra height to the postHeight (>140)
            
        }.frame(width: self.screenWidth).padding(0)
    
    } // View
                    
    init(age: Int) {
        print("Person age: \(age)")
        self.age = age;
        self.screenWidth = UIScreen.main.bounds.width;
    }
}

class Person {
    var age: Int;
    init(age:Int) {
        self.age = age;
    }
}

struct DiscoveryVC: View {
    var rows:Array<GridItem> = Array();
    var persons:Array<Person> = Array()
    let postHeight = 140.0;
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                LazyHGrid(rows: rows, alignment: .center, spacing:0, pinnedViews: []) {
                    ForEach((0...persons.count-1), id:\.self) {
                        Row.init(age: persons[$0].age)
                    }
                }.frame(width: UIScreen.main.bounds.width).padding(0)
            }.frame(width: UIScreen.main.bounds.width).padding(0)
        } // GeometryReader
    } // body
    
    init() {
        self.persons.append(Person.init(age: 20))
        self.persons.append(Person.init(age: 22))
        self.persons.append(Person.init(age: 22))
        self.persons.append(Person.init(age: 22))
        self.persons.append(Person.init(age: 22))
        self.persons.append(Person.init(age: 22))
        self.persons.append(Person.init(age: 22))
        self.persons.append(Person.init(age: 22))
        /** The .fixed is the row height! */
        self.rows = Array(repeating: GridItem(.fixed(self.postHeight), spacing:0), count:persons.count);
    }
}

struct DiscoveryVC_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryVC()
    }
}
