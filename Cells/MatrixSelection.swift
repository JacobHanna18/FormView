//
//  MatrixSelection.swift
//  DoneTracker
//
//  Created by Jacob Hanna on 22/12/2020.
//

import SwiftUI

struct MatrixSelection: View {
    let cell : FormCell
    var images : [AnyView] = []
    var columns : Int = 1
    @State var selected = 0
    var body: some View {
        VStack{
            CellTitleView(title: cell.title)
            ForEach(0 ..< Int(ceil(Double(images.count) / Double(columns))), id: \.self) { r in
                HStack{
                    Spacer()
                    ForEach(0 ..< columns, id: \.self) { c in
                        let i = columns * r + c
                        if i < images.count{
                            images[i].foregroundColor(selected == i ? Color.accentColor : Color(UIColor.label)).onTapGesture {
                                cell.setT(i)
                                selected = i
                            }
                        }else{
                            Color.clear
                        }
                        Spacer()
                        
                    }
                }
            }
        }
    }
}
