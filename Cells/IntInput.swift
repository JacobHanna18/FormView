//
//  IntInput.swift
//  FormView
//
//  Created by Jacob Hanna on 29/09/2020.
//

import SwiftUI

struct IntInput: View {
    let cell : FormCell
    @State var inp: String = "0"
    var body: some View {
        VStack{
            CellTitleView(title: cell.title).onTapGesture(perform: {
                cell.tap?()
            })
            TextField(cell.title ?? "IntIn Err", text: $inp, onCommit: {
                //UIApplication.shared.endEditing()
            }).keyboardType(.numberPad).textFieldStyle(MyTextFieldStyle())
        }.onChange(of: inp, perform: { value in
            if let d = Int(inp){
                cell.setT(d)
            }
        })
    }
}
