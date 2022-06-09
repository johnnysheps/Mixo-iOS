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
    var postHeight: CGFloat;
    
    var body: some View {
        VStack(alignment:.leading, spacing:0) {

            HStack(alignment:.top, spacing:0) {
                
                VStack(alignment:.leading, spacing:0) {
                    GeometryReader { geo in
                        Rectangle()
                            .fill(Color.yellow)
                            .overlay(
                                Image("maleicon")
                                    .resizable()
                                    .scaledToFit()
                                    .offset(x: 0, y: 0)
                            ).frame(width: geo.size.width*0.5, height: geo.size.width*0.5, alignment: .center)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    } // Geometry Reader
                    
                    Rectangle()
                        .fill(Color.orange)
                        .frame(width: self.screenWidth/2, height: self.postHeight*0.125)
                        .overlay(
                            Text("FN LN")
                                .frame(alignment:.center)
                        )
                    
                }.frame(width: self.screenWidth/2, height: self.postHeight)
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    GeometryReader { geo in
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: self.screenWidth/2, height: self.postHeight)
                            .overlay(
                                Rectangle()
                                    .fill(Color.red)
                                    .frame(width: self.screenWidth/4, height: self.screenWidth/4)
                                    .position(x: geo.frame(in: .local).width*0.25, y: geo.frame(in: .local).height*0.25)
                            ).overlay(
                                Rectangle()
                                    .fill(Color.orange)
                                    .frame(width: self.screenWidth/4, height: self.screenWidth/4)
                                    .position(x: geo.frame(in: .local).width*0.75, y: geo.frame(in: .local).height*0.25)
                            ).overlay(
                                Rectangle()
                                    .fill(Color.yellow)
                                    .frame(width: self.screenWidth/4, height: self.screenWidth/4)
                                    .position(x: geo.frame(in: .local).width*0.25, y: geo.frame(in: .local).height*0.75)
                            ).overlay(
                                Rectangle()
                                    .fill(Color.green)
                                    .frame(width: self.screenWidth/4, height: self.screenWidth/4)
                                    .position(x: geo.frame(in: .local).width*0.75, y: geo.frame(in: .local).height*0.75)
                            )
                    }
                }.frame(width: self.screenWidth/2, height: 130)
                
                
            }.frame(width: self.screenWidth, height: 130) // top horizontal - main content
            
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
                    
    init(age: Int, postHeight: CGFloat) {
        print("Person age: \(age)")
        self.age = age;
        self.screenWidth = UIScreen.main.bounds.width;
        self.postHeight = CGFloat(postHeight);
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
                        Row.init(age: persons[$0].age, postHeight: self.postHeight)
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
