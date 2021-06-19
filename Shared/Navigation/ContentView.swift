//
//  ContentView.swift
//  Shared
//
//  Created by Alex on 14.04.2021.
//

import SwiftUI

struct ContentView: View {
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    
    @ViewBuilder
    var body: some View {
        #if os(iOS)
        if horizontalSizeClass == .compact {
            CoursesView()
        } else {
            CoursesView()
        }
        #else
        SideBar()
            .frame(minWidth: 1000, minHeight: 600)
        #endif
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
