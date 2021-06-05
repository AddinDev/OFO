//
//  HomeView.swift
//  OFO
//
//  Created by addin on 28/05/21.
//

import SwiftUI

struct Promo: Identifiable {
  let id = UUID().uuidString
  let title: String
  let desc: String
  let icon: String
  let color: UIColor
}

struct HomeView: View {
  
  private let screen = UIScreen.main.bounds
  
  private let columns: [GridItem] = [
    .init(.flexible(minimum: 50, maximum: UIScreen.main.bounds.width / 4 - 20)),
    .init(.flexible(minimum: 50, maximum: UIScreen.main.bounds.width / 4 - 20)),
    .init(.flexible(minimum: 50, maximum: UIScreen.main.bounds.width / 4 - 20)),
    .init(.flexible(minimum: 50, maximum: UIScreen.main.bounds.width / 4 - 20))
  ]
  
  private let promos : [Promo] = [
    Promo(title: "udin", desc: "diskon", icon: "crown", color: .black),
    Promo(title: "udin", desc: "diskon", icon: "crown", color: .black),
    Promo(title: "udin", desc: "diskon", icon: "crown", color: .black),
    Promo(title: "udin", desc: "diskon", icon: "crown", color: .black),
    Promo(title: "udin", desc: "diskon", icon: "crown", color: .black),
    Promo(title: "udin", desc: "diskon", icon: "crown", color: .black)
  ]
  
  init() {
    UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color("Purple"))
    UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
  }
  
  var body: some View {
    content
      .navigationBarTitle(Text("OFO"), displayMode: .inline)
      .navigationBarColor(backgroundColor: .init(Color("Purple")), titleColor: .white)
      .navigationBarItems(trailing: notificationBtn)
      .font(.quicksand)
  }
  
}

extension HomeView {
  
  var content: some View {
    ScrollView {
    ZStack(alignment: .top) {
      bg
        LazyVStack {
          saldo
          saldoActions
          upgrade
          actions
          promo
          
          // more
          
          HomeView.spacer
        }
      }
    }
  }
  
  var saldo: some View {
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
        HStack(spacing: 3) {
          Text("OFO Points ")
          Text("0")
            .foregroundColor(.yellow)
        }
        .font(.custom("Quicksand-Bold", size: 13))
        HomeView.spacer
      }
      .foregroundColor(.white)
      HomeView.spacer
    }
    .padding(.horizontal)
    .frame(height: 65)
  }
  
  var saldoActions: some View {
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
    .padding(.vertical, 12)
    .background(Color.white)
    //    .background(BlurView(style: .regular))
    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
    .padding(.horizontal)
    .padding(.vertical, 10)
    .shadow(color: .black.opacity(0.1), radius: 3, x: 0.0, y: 3)
  }
  
  var upgrade: some View {
    HStack {
      Image(systemName: "circle")
        .resizable()
        .scaledToFit()
        .frame(width:  25)
        .padding(.trailing , 3)
      VStack(alignment: .leading) {
        Text("Upgrade ke OFO Premier")
          .font(.custom("Quicksand-Bold", size: 15))
        Text("Dapatkan lebih banyak keuntungan!")
          .font(.custom("Quicksand-Regular", size: 13))
      }
      HomeView.spacer
      Image(systemName: "chevron.right")
        .resizable()
        .scaledToFit()
        .frame(height:  15)
    }
    .foregroundColor(Color("DarkLightGreen"))
    .padding(12)
    .background(Color("SoftBlue"))
    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
    .padding(.horizontal)
  }
  
  var actions: some View {
    ZStack {
      Color.white
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
      //        .shadow(color: .black.opacity(0.1), radius: 3, x: 0.0, y: 3)
      LazyVGrid(columns: columns, spacing: 10) {
        ForEach(0..<8) { i in
          VStack(spacing: 4) {
            Image(systemName: "\(i).circle")
              .resizable()
              .scaledToFit()
              .frame(width: 25)
            Text("\(i)")
          }
        }
      }
      .padding()
    }
    .padding(.horizontal)
    .padding(.vertical, 8)
  }
  
  var promo: some View {
    VStack {
      HStack {
        Text("Promo")
        HomeView.spacer
        Text("Selengkapnya")
      }
      .padding(.horizontal)
      
      ZStack {
        Color.white
      TabView {
        ForEach(promos) { promo in
          CardView(title: promo.title,
                   desc: promo.desc,
                   imgName: promo.icon,
                   color: promo.color)
        }
      }
      .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
      }
      .frame(height: 260)
    }
  }
  
  var notificationBtn: some View {
    Button(action: {
      print("noti gang")
    }) {
      Image(systemName: "bell.fill")
        .resizable()
        .font(.system(size: 18))
        .foregroundColor(.white)
    }
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
      VStack(spacing: 5) {
        Image(systemName: imageName)
          .resizable()
          .scaledToFit()
          .frame(width: 25)
        Text(title)
          .font(.custom("Quicksand-Medium", size: 13))
      }
      .foregroundColor(Color("Purple"))
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
