//
//  LongtringInput.swift
//  FormView
//
//  Created by Jacob Hanna on 01/10/2020.
//

import SwiftUI

struct LongStringInput: View {
    let cell : FormCell
    @State var inp: String = ""
    var height : CGFloat
    var body: some View {
        VStack{
            CellTitleView(title: cell.title).onTapGesture(perform: {
                cell.tap?()
            })
            ZStack{
                Color.accentColor.opacity(0.5)
                TextEditor(text: $inp).frame(minHeight: height, idealHeight: height, maxHeight: .infinity)
            }
           
        }.onChange(of: inp, perform: { value in
            cell.setT(inp)
        })
    }
}
