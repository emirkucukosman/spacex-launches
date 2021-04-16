//
//  LaunchDetailsView.swift
//  SpaceXLaunches
//
//  Created by Emir Küçükosman on 16.04.2021.
//

import SwiftUI

struct LaunchDetailsView: View {
    var launch: LaunchViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Spacer()
                    AsyncImage(url: launch.patchImage) {
                        Text("Loading...")
                    }
                    .frame(width: 150, height: 150, alignment: .center)
                    Spacer()
                }
                
                HStack {
                    Text(launch.name)
                        .font(.title)
                    Spacer()
                }
                .padding([.leading, .top, .trailing], 15)
                
                HStack {
                    Text(launch.details ?? "No details were provided")
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding([.leading, .trailing], 15)
                .padding(.top, 10)
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Flight Number: ")
                        Spacer()
                        Text("\(launch.flightNumber)")
                    }
                    HStack {
                        Text("Success: ")
                        Spacer()
                        Image(systemName: launch.success ? "checkmark.circle.fill" : "multiply.circle.fill")
                            .foregroundColor(launch.success ? .green : .red)
                    }
                }
                .padding([.leading, .trailing], 15)
                .padding(.top, 10)
                
                HStack {
                    Spacer()
                    Text(launch.dateLocal)
                        .font(.caption)
                }
                .padding([.leading, .trailing], 15)
                .padding(.top, 10)
            }
        }
    }
}
