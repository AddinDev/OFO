//
//  CardView.swift
//  OFO
//
//  Created by addin on 05/06/21.
//

import SwiftUI

struct CardView: View {
  
  @State private var flip: Double = 0.0
  @State private var imgFlip = true
  
  var title: String
  var desc: String
  var imgName: String
  var color: UIColor
  
  private let screen = UIScreen.main.bounds
  
  var body: some View {
      content
  }
  
}

extension CardView {
  
  var content: some View {
    ZStack {
      Color
        .white
      VStack(alignment: .center) {
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
      .animation(.linear)
    }
    .frame(width: screen.width - 30, height: 200)
    .padding()
    .rotation3DEffect(
      .degrees(flip),
      axis: (x: 1.0, y: 0.0, z: 0.0)
    )
    .animation(.spring(response: 1, dampingFraction: 0.7, blendDuration: 0))
    .onTapGesture {
      flip += 180
      DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1) {
        imgFlip.toggle()
      }
    }
  }
  
  var card1: some View {
    ZStack {
      Color(color)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.8), radius: 3, x: 1, y: 2)
      HStack {
        VStack(alignment: .leading) {
          Text(title)
            .font(.title)
          Text(desc)
            .font(.title3)
            .italic()
          spacer
          Image(systemName: imgName)
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
      .foregroundColor(.white)
    }
  }
  
  var card2: some View {
    ZStack {
      Color(color)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.8), radius: 3, x: 1, y: 2)
      VStack {
        Text("BREAD DOGE")
          .font(.title)
          .italic()
          .padding(.top, 5)
        Image(systemName: imgName)
          .resizable()
          .scaledToFit()
          .frame(width: 200)
      }
      .padding(.bottom)
      .foregroundColor(.white)
    }
    .rotation3DEffect(
      .degrees(180),
      axis: (x: 1.0, y: 0.0, z: 0.0)
    )
  }
  
  var flipButton: some View {
    Button(action: {
      flip += 180
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


struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    CardView(title: "udin", desc: "diskon 50%", imgName: "crown", color: .black)
  }
}
