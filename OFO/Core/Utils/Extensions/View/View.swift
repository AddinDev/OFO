//
//  View.swift
//  OFO
//
//  Created by addin on 04/06/21.
//

import SwiftUI

extension View {
  
  static var loadingIndicator: some View {
    VStack {
      Text("Loading")
      ProgressView()
        .progressViewStyle(CircularProgressViewStyle())
    }
  }
  
  static var spacer: some View {
    Spacer()
  }
  
}

extension Font {
  
  static let quicksand = custom("Quicksand-Regular", size: 18)
  
}
