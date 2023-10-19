//
//  ContentView.swift
//  task7
//
//  Created by Роман on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var isClicked: Bool = false
    @Namespace private var namespace
    
    var width: CGFloat {
        isClicked ? UIScreen.main.bounds.size.width - 100 : 80
    }
    
    var height: CGFloat {
        isClicked ? UIScreen.main.bounds.size.width - 100 : 40
    }
    
    var body: some View {
        VStack() {
            isClicked ? nil : Spacer()
            HStack {
                isClicked ? nil : Spacer()
                ZStack {
                    Rectangle()
                        .foregroundColor(.blue)
                        .makeSizeAndRound(width: width, height: height)

                    Button(action: {

                    }) {

                        Text("Open")
                        .foregroundColor(.white)
                        .makeSizeAndRound(width: width, height: height)
                    }
                }
            }
        }
//        VStack {
//
//            if !isClicked {
//                OpenButton(namespace: namespace, isClicked: &isClicked)
//                    .matchedGeometryEffect(id: "detail", in: namespace)
//            } else {
//                DetailsButton(namespace: namespace)
//                    .matchedGeometryEffect(id: "list", in: namespace)
//            }
//        }

    }
}

struct AddSizeAndStateView: ViewModifier {
    
    private var width: CGFloat
    private var height: CGFloat
    
    init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
    }
    
    func body(content: Content) -> some View {
        content
            .frame(width: width, height: height)
            .background(.blue)
            .cornerRadius(10)
    }
}

extension View {
    func makeSizeAndRound(width: CGFloat, height: CGFloat) -> some View {
        return modifier(AddSizeAndStateView(width: width, height: height))
    }
}

//struct OpenButton: View {
//
//    private let namespace: Namespace.ID
//    @State var isClicked: Bool = false
//
//    init(namespace: Namespace.ID, isClicked: inout Bool) {
//        self.namespace = namespace
//        self.isClicked = isClicked
//    }
//
//    var body: some View {
//        Spacer()
//        HStack {
//            Spacer()
//            Button(action: {
//                isClicked.toggle()
//            }) {
//                Text("Open")
//                .foregroundColor(.white)
//                .frame(width: 80, height: 40)
//                .background(.blue)
//                .cornerRadius(10)
//            }
//        }
//    }
//}
//
//struct DetailsButton: View {
//
//    private let namespace: Namespace.ID
//
//
//    init(namespace: Namespace.ID) {
//        self.namespace = namespace
//    }
//
//    var body: some View {
//        HStack {
//            Spacer()
//            Button(action: {
//                withAnimation(.easeInOut) {
////                    isZoomed.toggle()
//                }
//            }, label: {
//                HStack {
//                    Image(systemName: "arrowshape.backward.fill")
//                    Text("Back")
//                }
//                .padding()
//                .font(.title2)
//                .foregroundStyle(.white)
//            })
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
