//
//  DiscoveryVC.swift
//  Mixo
//
//  Created by Weng on 6/4/22.
//  Copyright © 2022 Sean Hall. All rights reserved.
//

import SwiftUI


var postHeight:CGFloat = 140;
var dividerHeight:CGFloat = 5;
var rowHeight:CGFloat = 145; // Combined postHeight + dividerHeight + ...; Doing it here for maintainability



struct Row: View {
    let age: Int;
    var screenWidth: CGFloat;
    var avatarQuadrant:CGFloat = 45;
    
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
                                    .overlay(
                                        GeometryReader { geo in
                                            Text("FN LN")
                                                .frame(width: self.screenWidth/2, height: 20)
                                                .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY+10)
                                        } // Geo
                                    ) // Overlay
                            ).frame(width: avatarQuadrant*2, height: avatarQuadrant*2, alignment: .center)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    } // Geometry Reader
                    
                    
                }.frame(width: self.screenWidth/2, height: postHeight)
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    GeometryReader { geo in
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: self.screenWidth/2, height: postHeight)
                            .overlay(
                                Rectangle()
                                    .fill(Color.red)
                                    .frame(width: avatarQuadrant, height: avatarQuadrant)
                                    .position(x: geo.frame(in: .local).midX - avatarQuadrant/2, y: geo.frame(in: .local).midY - avatarQuadrant/2)
                                        .overlay(
                                            ZStack {
                                                Rectangle()
                                                    .fill(Color.green)
                                                    .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                    .offset(x: -avatarQuadrant/4 - (avatarQuadrant/2), y: -avatarQuadrant/4 - (avatarQuadrant/2))
                                                Rectangle()
                                                    .fill(Color.yellow)
                                                    .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                    .offset(x: -avatarQuadrant/4 - 0, y: -avatarQuadrant/4 - (avatarQuadrant/2))
                                                Rectangle()
                                                    .fill(Color.black)
                                                    .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                    .offset(x: -avatarQuadrant/4 - (avatarQuadrant/2), y: -avatarQuadrant/4 - 0)
                                                Rectangle()
                                                    .fill(LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom))
                                                    .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                    .offset(x: -avatarQuadrant/4 - 0, y: -avatarQuadrant/4 - 0)
                                            }
                                        )
                            ).overlay(
                                Rectangle()
                                    .fill(Color.orange)
                                    .frame(width: avatarQuadrant, height: avatarQuadrant)
                                    .position(x: geo.frame(in: .local).midX - avatarQuadrant/2, y: geo.frame(in: .local).midY + avatarQuadrant/2)
                                        .overlay(
                                            ZStack {
                                                Rectangle()
                                                    .fill(Color.green)
                                                    .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                    .offset(x: -avatarQuadrant/4 - (avatarQuadrant/2), y: -avatarQuadrant/4 + (avatarQuadrant/2))
                                                Rectangle()
                                                    .fill(Color.yellow)
                                                    .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                    .offset(x: -avatarQuadrant/4 - 0, y: -avatarQuadrant/4 + (avatarQuadrant/2))
                                                Rectangle()
                                                    .fill(Color.black)
                                                    .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                    .offset(x: -avatarQuadrant/4 - (avatarQuadrant/2), y: -avatarQuadrant/4 + (2*avatarQuadrant/2))
                                                Rectangle()
                                                    .fill(LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom))
                                                    .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                    .offset(x: -avatarQuadrant/4 - 0, y: -avatarQuadrant/4 + (2*avatarQuadrant/2))
                                            }
                                        )
                            ).overlay(
                                Rectangle()
                                    .fill(Color.purple)
                                    .frame(width: avatarQuadrant, height: avatarQuadrant)
                                    .position(x: geo.frame(in: .local).midX + avatarQuadrant/2, y: geo.frame(in: .local).midY - avatarQuadrant/2)
                                        .overlay(
                                            ZStack {
                                                Rectangle()
                                                    .fill(Color.green)
                                                    .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                    .offset(x: avatarQuadrant/4 + 0, y: avatarQuadrant/4 - (2*avatarQuadrant/2))
                                                Rectangle()
                                                    .fill(Color.yellow)
                                                    .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                    .offset(x: avatarQuadrant/4 + (avatarQuadrant/2), y: avatarQuadrant/4 - (2*avatarQuadrant/2))
                                                Rectangle()
                                                    .fill(Color.black)
                                                    .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                    .offset(x: avatarQuadrant/4 + 0, y: avatarQuadrant/4 - (avatarQuadrant/2))
                                                Rectangle()
                                                    .fill(LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom))
                                                    .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                    .offset(x: avatarQuadrant/4 + (avatarQuadrant/2), y: avatarQuadrant/4 - (avatarQuadrant/2))
                                            }
                                        )
                            ).overlay(
                                Rectangle()
                                    .fill(Color.blue)
                                    .frame(width: avatarQuadrant, height: avatarQuadrant)
                                    .position(x: geo.frame(in: .local).midX + avatarQuadrant/2, y: geo.frame(in: .local).midY + avatarQuadrant/2)
                                    .overlay(
                                        ZStack {
                                            Rectangle()
                                                .fill(Color.green)
                                                .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                .offset(x: avatarQuadrant/4 + 0, y: avatarQuadrant/4 + 0)
                                            Rectangle()
                                                .fill(Color.yellow)
                                                .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                .offset(x: avatarQuadrant/4 + (avatarQuadrant/2), y: avatarQuadrant/4 + 0)
                                            Rectangle()
                                                .fill(Color.black)
                                                .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                .offset(x: avatarQuadrant/4, y: avatarQuadrant/4 + (avatarQuadrant/2))
                                            Rectangle()
                                                .fill(LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom))
                                                .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                .offset(x: avatarQuadrant/4 + (avatarQuadrant/2), y: avatarQuadrant/4 + (avatarQuadrant/2))
                                        }
                                    )
                            )
                    }
                }.frame(width: self.screenWidth/2, height: postHeight)
                
                
            }.frame(width: self.screenWidth, height: postHeight) // top horizontal - main content
            
            Image("loadingbg")
                    .resizable()
                    .frame(width: self.screenWidth, height: dividerHeight)
        
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
        self.rows = Array(repeating: GridItem(.fixed(rowHeight), spacing:0), count:persons.count);
    }
}

struct DiscoveryVC_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryVC()
    }
}
