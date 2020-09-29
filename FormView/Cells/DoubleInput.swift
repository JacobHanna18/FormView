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
            Text(cell.title ?? "error")
            TextField(cell.title ?? "error", text: $inp).keyboardType(.decimalPad)
        }.onAppear(perform: {
            inp = (cell.getT(Double.self) ?? 0).toString
        }).onChange(of: inp, perform: { value in
            if let d = Double(inp){
                cell.setT(d)
            }
        })
    }
}

var testDoubleInput = 6.076
struct DoubleInput_Previews: PreviewProvider {
    static var previews: some View {
        DoubleInput(cell: FormCell(type: .DoubleInput, title: "Test Title", set: { (str) in
            if let st = str as? Double{
                testDoubleInput = st;
                print(testDoubleInput)
            }
        }, get: { () -> Any in
            return testDoubleInput
        }))
    }
}
