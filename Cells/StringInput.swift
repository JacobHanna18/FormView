//
//  StringInput.swift
//  FormView
//
//  Created by Jacob Hanna on 29/09/2020.
//

import SwiftUI



struct StringInput: View {
    let cell : FormCell
    @State var inp: String = ""
    var body: some View {
        VStack{
            CellTitleView(title: cell.title).onTapGesture(perform: {
                cell.tap?()
            })
            TextField(cell.title ?? "StrIn Err", text: $inp, onCommit: {
                //UIApplication.shared.endEditing()
            }).textFieldStyle(MyTextFieldStyle())
        }.onChange(of: inp, perform: { value in
            cell.setT(inp)
        })
    }
}
