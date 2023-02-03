//
//  ListView.swift
//  TodoAppSUI
//
//  Created by Daniel on 12.12.2022.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listVM: ListViewModel
    
    @State var editMode: EditMode = .inactive
    @State var selection = Set<UUID>()
    @State var pinnedTask = false
    
    var body: some View {
        ZStack {
            
            if listVM.items.isEmpty {
                NoListView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List(selection: $selection) {
                    ForEach(listVM.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listVM.update(item: item)
                                
                                }
                            }
                    }
                    .onDelete(perform: listVM.deleteItem)
                    .onMove(perform: listVM.moveItem)
              }
                .environment(\.editMode, $editMode)
                .contextMenu {
                    Button(action: {
                        
                    }) {
                        if pinnedTask {
                            Text("Pinned")
                        } else {
                            Text("Pin")
                        }
                    }
                }
             }
          }
        .navigationBarTitle("Todo List 🖌")
        .navigationBarItems(leading: editButton, trailing: NavigationLink(destination: AddView()) {
            Text("Add")
        })
    }
    
    private var editButton: some View {
        if editMode == .inactive {
            return Button(action: {
                self.editMode = .active
                self.selection = Set<UUID>()
            }) {
                Text("Edit")
            }
        }
        else {
            return Button(action: {
                self.editMode = .inactive
                self.selection = Set<UUID>()
            }) {
                Text("Done")
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
                .environmentObject(ListViewModel())
        }
    }
}
