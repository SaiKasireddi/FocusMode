//
//  HomeView.swift
//  FocusMode
//
//  Created by Sai Kumar Kasireddi's MacBook on 08/12/21.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnBoardingViewActive: Bool = false

    @State private var isAnimating: Bool = false

    var body: some View {
      VStack(spacing: 20) {
        // HEADER

        Spacer()

        ZStack {
          CircleGroupView(shapeColor: .gray, shapeOpacity: 0.1)

          Image("character-2")
            .resizable()
            .scaledToFit()
            .padding()
            .offset(y: isAnimating ? 35 : -35)
            .animation(
              Animation
                .easeOut(duration: 4)
                .repeatForever()
              , value: isAnimating
            )
        }

        // CENTER

        Text("The time that leads to mastery is dependent on the intensity of our focus.")
          .font(.title3)
          .fontWeight(.light)
          .foregroundColor(.secondary)
          .multilineTextAlignment(.center)
          .padding()

        //FOOTER

        Button(action: {
          withAnimation {
            playSound(sound: "success", type: "mp3")
            isOnBoardingViewActive = true
          }
        }, label: {
          Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
            .imageScale(.large)

          Text("Restart")
            .font(.system(.title3, design: .rounded))
            .fontWeight(.bold)
        }) //: BUTTON
          .buttonStyle(.borderedProminent)
          .buttonBorderShape(.capsule)
          .controlSize(.large)
      } //: VSTACK
      .onAppear(perform: {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: { isAnimating = true } )
      })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
