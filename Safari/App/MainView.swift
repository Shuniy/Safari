//
//  MainView.swift
//  Safari
//
//  Created by Shubham Kumar on 24/01/22.
//

import SwiftUI

struct MainView: View {
    //MARK: PROPERTIES
    
    //MARK: BODY
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }//:tabItem
            
            VideoListView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Watch")
                }//: tabitem
            
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Locations")
                }//:tabItem
            
            GalleryView()
                .tabItem{
                    Image(systemName: "photo")
                    Text("Gallery")
                }//:tabItem
        }//: TabView
    }//: Body
}

//MARK: PREVIEW
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
