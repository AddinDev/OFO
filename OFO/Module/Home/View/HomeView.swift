//
//  HomeView.swift
//  OFO
//
//  Created by addin on 28/05/21.
//

import SwiftUI

struct HomeView: View {
  
  private let screen = UIScreen.main.bounds
  
  var body: some View {
    content
      .navigationBarTitle(Text("OFO"), displayMode: .inline)
      .navigationBarColor(backgroundColor: .init(Color("Purple")), titleColor: .white)
      .font(.quicksand)
  }
  
}

extension HomeView {
  
  var content: some View {
    ZStack(alignment: .top) {
      bg
      ScrollView {
        LazyVStack {
          top
          topMid
          
          // more
          
          HomeView.spacer
        }
      }
    }
  }
  
  var top: some View {
    HStack {
      VStack(alignment: .leading) {
        Text("OFO Cash")
          .font(.custom("Quicksand-Bold", size: 13))
        HStack {
          Text("RP")
            .font(.custom("Quicksand-Bold", size: 13))
          Text("26.696")
            .font(.custom("Quicksand-Bold", size: 24))
        }
        Text("OFO Points 0")
          .font(.custom("Quicksand-SemiBold", size: 13))
        HomeView.spacer
      }
      .foregroundColor(.white)
      HomeView.spacer
    }
    .padding(.horizontal)
    .frame(height: 65)
  }
  
  var topMid: some View {
    HStack {
      HomeView.spacer
      CustomActionButton(imageName: "restart.circle", title: "Restart") {
        
      }
      HomeView.spacer
      CustomActionButton(imageName: "command.circle", title: "Command") {
        
      }
      HomeView.spacer
      CustomActionButton(imageName: "sleep", title: "Sleep") {
        
      }
      HomeView.spacer
    }
    .foregroundColor(.black)
    .padding(.vertical)
    .background(Color.white)
    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
    .padding(.horizontal)
    .padding(.vertical, 10)
    .shadow(radius: 2)
  }
  
  var bg: some View {
    ZStack {
      //      Image("purplesupra")
      //        .resizable()
      //        .scaledToFill()
      LinearGradient(gradient: Gradient(colors: [Color("Purple"), Color("Purple").opacity(0.2)]), startPoint: .top, endPoint: .bottom)
    }
    .frame(height: 120)
  }
  
}

struct CustomActionButton: View {
  
  var imageName: String
  var title: String
  var action: () -> Void
  
  var body: some View {
    Button(action: {
      action()
    }) {
      VStack {
        Image(systemName: imageName)
          .renderingMode(.original)
          .resizable()
          .scaledToFit()
          .frame(width: 25)
        Text(title)
          .font(.custom("Quicksand-Medium", size: 15))
      }
    }
  }
  
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      HomeView()
    }
  }
}
