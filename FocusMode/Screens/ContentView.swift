//
//  ContentView.swift
//  FocusMode
//
//  Created by Sai Kumar Kasireddi's MacBook on 08/12/21.
//

import SwiftUI

struct ContentView: View {
  @AppStorage("onboarding") var isOnBoardingViewActive: Bool = true

    var body: some View {
      ZStack {
        if isOnBoardingViewActive {
          OnBoardingView()
        } else {
          HomeView()
        }
      } //: ZSTACK
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
