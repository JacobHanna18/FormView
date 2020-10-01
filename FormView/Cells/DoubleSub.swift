//
//  DoubleSub.swift
//  FormView
//
//  Created by Jacob Hanna on 29/09/2020.
//

import SwiftUI

struct DoubleSub: View {
    let cell : FormCell
    var body: some View {
        HStack{
            Text(cell.title ?? "error")
            Spacer()
            Text((cell.getT(Double.self) ?? 0).toString)
        }
    }
}

struct DoubleSub_Previews: PreviewProvider {
    static var previews: some View {
        DoubleSub(cell: FormCell(type: .DoubleSub, title: "Test Title", get: { () -> Any in
            return testDoubleInput
        }))
    }
}
