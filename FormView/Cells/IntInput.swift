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
            Text(cell.title ?? "error")
            TextField(cell.title ?? "error", text: $inp).keyboardType(.numberPad)
        }.onAppear(perform: {
            inp = (cell.getT(Int.self) ?? 0).toString
        }).onChange(of: inp, perform: { value in
            if let d = Int(inp){
                cell.setT(d)
            }
        })
    }
}

var testIntInput = 7647
struct IntInput_Previews: PreviewProvider {
    static var previews: some View {
        IntInput(cell: FormCell(type: .DoubleInput, title: "Test Title", set: { (str) in
            if let st = str as? Int{
                testIntInput = st;
                print(testIntInput)
            }
        }, get: { () -> Any in
            print("get")
            return testIntInput
        }))
    }
}
