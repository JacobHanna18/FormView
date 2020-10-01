//
//  StringSub1.swift
//  FormView
//
//  Created by Jacob Hanna on 29/09/2020.
//

import SwiftUI

struct StringSub2: View {
    let cell : FormCell
    var body: some View {
        HStack{
            Text(cell.title ?? "error")
            Spacer()
            Text(cell.getT(String.self) ?? "error")
        }
    }
}

struct StringSub2_Previews: PreviewProvider {
    static var previews: some View {
        StringSub2(cell: FormCell(type: .StringSub2, title: "Test Title", get: { () -> Any in
            return "test subtitle 2"
        }))
    }
}
