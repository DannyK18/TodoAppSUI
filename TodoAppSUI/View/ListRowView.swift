//
//  ListRowView.swift
//  TodoAppSUI
//
//  Created by Daniel on 12.12.2022.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel

    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical , 8)
    }
    
    func getId() -> Int {
        return Int(self.item.id) ?? 0
       }
    
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(Title: "Item1", IsCompleted: true)
    static var item2 = ItemModel(Title: "Item1", IsCompleted: false)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
