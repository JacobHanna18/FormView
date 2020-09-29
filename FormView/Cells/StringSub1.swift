//
//  StringSub1.swift
//  FormView
//
//  Created by Jacob Hanna on 29/09/2020.
//

import SwiftUI

struct StringSub1: View {
    let cell : FormCell
    var body: some View {
        VStack{
            Text(cell.title ?? "error")
                .multilineTextAlignment(.center)
                .padding(.trailing)
            Text(cell.getT(String.self) ?? "error")
        }
    }
}

struct StringSub1_Previews: PreviewProvider {
    static var previews: some View {
        StringSub1(cell: FormCell(type: .StringSub1, title: "Test Title", get: { () -> Any in
            return "test subtitle 1"
        }))
    }
}
