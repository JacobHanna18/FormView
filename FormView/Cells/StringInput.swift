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
            CellTitleView(title: cell.title)
            TextField(cell.title ?? "error", text: $inp, onCommit: {
                UIApplication.shared.endEditing()
            }).textFieldStyle(RoundedBorderTextFieldStyle())
        }.onAppear(perform: {
            inp = cell.getT(String.self) ?? ""
        }).onChange(of: inp, perform: { value in
            cell.setT(inp)
        })
    }
}

var testStringInput = "test input"
struct StringInput_Previews: PreviewProvider {
    static var previews: some View {
        StringInput(cell: FormCell(type: .StringInput, title: "Test Title", set: { (str) in
            if let st = str as? String{
                testStringInput = st;
                print(testStringInput)
            }
        }, get: { () -> Any in
            print("get")
            return testStringInput
        }))
    }
}
