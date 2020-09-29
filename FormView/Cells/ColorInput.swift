//
//  ColorInput.swift
//  FormView
//
//  Created by Jacob Hanna on 29/09/2020.
//

import SwiftUI

struct ColorInput: View {
    let cell : FormCell
    @State var inp: Color = .red
    var body: some View {
        VStack{
            ColorPicker(cell.title ?? "error", selection: $inp)
        }.onAppear(perform: {
            inp = (cell.getT(Color.self) ?? Color.red)
        }).onChange(of: inp, perform: { value in
            cell.setT(inp)
        })
    }
}

var testColorInput : Color = .green
struct ColorInput_Previews: PreviewProvider {
    static var previews: some View {
        ColorInput(cell: FormCell(type: .ColorInput, title: "test title", set: { (color) in
            if let co = color as? Color{
                print(co.description)
                testColorInput = co
            }
        }, get: { () -> Any in
            return testColorInput
        }))
    }
}
