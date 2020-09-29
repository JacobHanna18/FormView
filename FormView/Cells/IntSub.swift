//
//  IntSub.swift
//  FormView
//
//  Created by Jacob Hanna on 29/09/2020.
//

import SwiftUI

struct IntSub: View {
    let cell : FormCell
    var body: some View {
        HStack{
            Text(cell.title ?? "error")
                .multilineTextAlignment(.center)
                .padding(.trailing)
            Text((cell.getT(Int.self) ?? 0).toString)
        }
    }
}

struct IntSub_Previews: PreviewProvider {
    static var previews: some View {
        IntSub(cell: FormCell(type: .StringSub1, title: "Test Title", get: { () -> Any in
            return testIntInput
        }))
    }
}
