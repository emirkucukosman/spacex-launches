//
//  ContentView.swift
//  SpaceXLaunches
//
//  Created by Emir Küçükosman on 16.04.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var launchListViewModel = LaunchListViewModel()
    
    @ViewBuilder
    var body: some View {
        if launchListViewModel.error == nil && launchListViewModel.launches == nil {
            Text("Loading Launches...")
                .font(.title)
                .padding()
        }
        
        if let error = launchListViewModel.error {
            Text(error)
                .font(.title)
                .foregroundColor(.red)
                .padding()
        }
        
        if launchListViewModel.error == nil, let launches = launchListViewModel.launches {
            NavigationView {
                List(launches, id: \.self) { launch in
                    NavigationLink(destination: LaunchDetailsView(launch: launch)) {
                        HStack {
                            AsyncImage(url: launch.patchImage) {
                                Text("Loading")
                                    .font(.caption)
                            }
                            .frame(width: 50, height: 50, alignment: .center)
                            
                            Text(launch.name)
                                .padding(.leading, 10)
                        }
                    }
                }
                .navigationBarHidden(true)
            }
        }
    }
}
