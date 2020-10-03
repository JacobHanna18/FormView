//
//  BoolInput.swift
//  FormView
//
//  Created by Jacob Hanna on 29/09/2020.
//

import SwiftUI

struct BoolInput: View {
    let cell : FormCell
    @State var inp: Bool = true
    var body: some View {
        HStack{
            Toggle(isOn: $inp, label: {
                CellTitleView(title: cell.title)
            })
        }.onAppear(perform: {
            inp = (cell.getT(Bool.self) ?? true)
        }).onChange(of: inp, perform: { value in
            cell.setT(inp)
        })
    }
}

var testBoolInput : Bool = true
struct BoolInput_Previews: PreviewProvider {
    static var previews: some View {
        BoolInput(cell: FormCell(type: .BoolInput, title: "Test Title", set: { (str) in
            if let st = str as? Bool{
                testBoolInput = st;
                print(testBoolInput)
            }
        }, get: { () -> Any in
            print("get")
            return testBoolInput
        }))
    }
}
