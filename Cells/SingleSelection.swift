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
    @State var inp: Int = 0
    var body: some View {
        VStack{
            CellTitleView(title: cell.title).onTapGesture(perform: {
                cell.tap?()
            })
            HStack {
                ForEach((0..<labels.count), id: \.self) {i in
                    Spacer()
                    Button(labels[i]) {
                        inp = i
                    }.padding(.all, 5)
                    .foregroundColor(i == inp ? Color(UIColor.systemBackground) : Color.accentColor)
                    .frame( maxWidth: .infinity)
                    .background((i == inp ? Color.accentColor : Color.clear))
                    .cornerRadius(10.0)
                }
                Spacer()
            }
        }.onChange(of: inp, perform: { value in
            cell.setT(inp)
        })
    }
}
