//
//  MatrixSelection.swift
//  DoneTracker
//
//  Created by Jacob Hanna on 22/12/2020.
//

import SwiftUI

struct MatrixSelection: View {
    let cell : FormCell
    @State var images : [Image] = []
    @State var columns : Int = 1
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
                            images[i].resizable().aspectRatio(contentMode: .fill).foregroundColor(selected == i ? Color.accentColor : Color(UIColor.label)).onTapGesture {
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
        }.onAppear(perform: {
            switch cell.type {
            case let .MatrixSelection(columns: cul, values: img):
                images = img
                columns = cul
                selected = cell.getT(Int.self) ?? 0
            default:
                break
            }
            
        })
    }
}
