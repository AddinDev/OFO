//
//  HomeView.swift
//  OFO
//
//  Created by addin on 28/05/21.
//

import SwiftUI

struct HomeView: View {
  
  @State var flip = true
  @State var imgFlip = true
  
  init() {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithTransparentBackground()
    appearance.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.5)
    UINavigationBar.appearance().standardAppearance = appearance
  }
  
  var body: some View {
    content
      .navigationBarTitle("Saldo", displayMode: .inline)
      .navigationBarItems(trailing: flipButton)
  }
  
}

extension HomeView {
  
  var content: some View {
    ZStack {
      Color
        .white
      VStack {
        card
        spacer
      }
    }
  }
  
  var card: some View {
    Group {
      ZStack {
        if imgFlip {
          card1
        } else {
          card2
        }
      }
    }
    .frame(width: 330, height: 200)
    .padding()
    .rotation3DEffect(
      flip ? .degrees(0) : .degrees(180),
      axis: (x: 0.0, y: 1.0, z: 0.0)
    )
    .animation(.spring(response: 1, dampingFraction: 0.7, blendDuration: 0))
  }
  
  var card1: some View {
    ZStack {
      Color(
        .black)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.8), radius: 8, x: 1, y: 2)
      HStack {
        VStack(alignment: .leading) {
          Text("Addin Santhos")
            .font(.title)
          Text("Blue Blood Pass")
            .font(.title3)
            .italic()
          spacer
          Image(systemName: "crown")
            .resizable()
            .scaledToFit()
            .frame(width: 50)
          spacer
          Text("Flip card to see user's spirit animal.")
            .font(.footnote)
        }
        .padding()
        spacer
      }
      .foregroundColor(.yellow)
    }
  }
  
  var card2: some View {
    ZStack {
      Color
        .black
        .cornerRadius(10)
        .shadow(color: .yellow.opacity(0.8), radius: 8, x: 1, y: 2)
      VStack {
        Text("BREAD DOGE")
          .font(.title)
          .italic()
          .padding(.top, 5)
        Image("doge")
          .renderingMode(.original)
          .resizable()
          .scaledToFit()
          .frame(width: 200)
      }
      .foregroundColor(.yellow)
    }
    .rotation3DEffect(
      .degrees(180),
      axis: (x: 0.0, y: 1.0, z: 0.0)
    )
  }
  
  var flipButton: some View {
    Button(action: {
      flip.toggle()
      DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.2) {
        imgFlip.toggle()
      }
    }) {
      Text("flip")
    }
  }
  
  var spacer: some View {
    Spacer()
  }
  
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
