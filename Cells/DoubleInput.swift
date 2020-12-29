//
//  DoubleInput.swift
//  FormView
//
//  Created by Jacob Hanna on 29/09/2020.
//

import SwiftUI

struct DoubleInput: View {
    let cell : FormCell
    @State var inp: String = "0.0"
    var body: some View {
        VStack{
            CellTitleView(title: cell.title).onTapGesture(perform: {
                cell.tap?()
            })
            TextField(cell.title ?? "DoubleIn Err", text: $inp, onCommit: {
                //UIApplication.shared.endEditing()
            }).keyboardType(.decimalPad).textFieldStyle(MyTextFieldStyle())
        }.onChange(of: inp, perform: { value in
            if let d = Double(inp){
                cell.setT(d)
            }
        })
    }
}
