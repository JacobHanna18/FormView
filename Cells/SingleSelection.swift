//
//  SingleSelection.swift
//  FormView
//
//  Created by Jacob Hanna on 01/10/2020.
//

import SwiftUI

struct SingleSelection: View {
    let cell : FormCell
    var labels : [String]
    let columns : Int
    
    var col : Int{
        return columns == -1 ? labels.count : columns
    }
    @State var inp: Int = 0
    var body: some View {
        VStack{
            CellTitleView(title: cell.title).onTapGesture(perform: {
                cell.tap?()
            })
            ForEach(0 ..< Int(ceil(Double(labels.count) / Double(col))), id: \.self) { r in
                HStack{
                    Spacer()
                    ForEach(0 ..< col, id: \.self) { c in
                        let i = col * r + c
                        Button(labels[i]) {
                            inp = i
                        }.padding(.all, 5)
                        .foregroundColor(i == inp ? Color(UIColor.systemBackground) : Color.accentColor)
                        .frame( maxWidth: .infinity)
                        .background((i == inp ? Color.accentColor : Color.clear))
                        .cornerRadius(10.0)
                        Spacer()
                        
                    }
                }
            }
        }.onChange(of: inp, perform: { value in
            cell.setT(inp)
        })
    }
}
