//
//  GeometryReaderBootcampView.swift
//  SwiftUI Advanced Learning
//
//  Created by Sai Jannali on 9/29/23.
//

import SwiftUI

struct GeometryReaderBootcampView: View {
    
    func gerPercent(geo: GeometryProxy) -> Double {
        let maxDist = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDist))
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .rotation3DEffect(
                                Angle(degrees: gerPercent(geo: geometry) * 40),
                                axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                            )
                    }
                    .frame(width:300, height: 250)
                    .padding()


                }
            }
        }
//        GeometryReader { geometry in
//            HStack(spacing: 0){
//                Rectangle()
//                    .fill(Color.red)
//                    .frame(width: geometry.size.width * 0.666)
//                
//                Rectangle().fill(Color.blue)
//            }
//            .ignoresSafeArea()
//        }
    }
    
}

#Preview {
    GeometryReaderBootcampView()
}
