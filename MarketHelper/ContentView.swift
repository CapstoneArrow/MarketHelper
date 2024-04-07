//
//  ContentView.swift
//  MarketHelper
//
//  Created by Andy on 3/27/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        if sizeClass == .regular {
            // iPad interface
            NavigationSplitView(columnVisibility: .constant(.all)) {
                List {
                    NavigationLink(destination: HomeView()) {
                        HStack {
                            Image(systemName: "house.fill")
                                .foregroundColor(.blue)
                            Text("홈")
                        }
                        
                    }
                    
                    NavigationLink(destination: FavoritesView()) {
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text("즐겨찾기")
                        }
                    }
                    
                    NavigationLink(destination: MorePageView()) {
                        HStack {
                            Image(systemName: "ellipsis")
                                .foregroundColor(.primary)
                            Text("더보기")
                        }
                    }
                }
                .navigationTitle("Markets")
            } detail: {
                HomeView()
            }
            .navigationSplitViewStyle(.balanced)
            
        } else {
            // iPhone interface
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("홈")
                    }
                
                FavoritesView()
                    .tabItem {
                        Image(systemName: "star.fill")
                        Text("즐겨찾기")
                    }
                
                MorePageView()
                    .tabItem {
                        Image(systemName: "ellipsis")
                        Text("더보기")
                    }
            }
        }
        
        
        
    }
}

#Preview {
    ContentView()
}

