//
//  ContentView.swift
//  TodoAppSUI
//
//  Created by Daniel on 05.12.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var listVM: ListViewModel
    
    var body: some View {
      ListView() 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
