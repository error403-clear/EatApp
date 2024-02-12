////
////  NavigationStack.swift
////  JustEat2
////
////  Created by Macbook Pro on 2/3/24.
////
//
//import Foundation
//import SwiftUI
//
//struct NavigationItem: Identifiable, Hashable {
//    var id = UUID()
//    var title: String
//    var icon: String
//    var menu: Menu
//}
//
//var navigationItems = [
//    NavigationItem(title: "Compass App", icon: "safari", menu: .compass),
//    NavigationItem(title: "3D Card", icon: "lanyardcard", menu: .card),
//    NavigationItem(title: "Radial Layout", icon: "clock", menu: .radial),
//    NavigationItem(title: "Gooey Action Button", icon: "plus.circle", menu: .actionbutton),
//    NavigationItem(title: "Gooey Menu", icon: "drop", menu: .gooey),
//    NavigationItem(title: "Charts", icon: "chart.xyaxis.line", menu: .charts),
//    NavigationItem(title: "Half Sheet", icon: "rectangle.portrait.bottomhalf.filled", menu: .halfsheet),
//]
//
//enum Menu: String {
//    case compass
//    case card
//    case charts
//    case radial
//    case halfsheet
//    case gooey
//    case actionbutton
//}
//
////NavigationStack {
//    List(navigationItems) { item in
//        NavigationLink(value: item) {
//            Label(item.title, systemImage: item.icon)
//                .foregroundColor(.primary)
//        }
//    }
//    .listStyle(.plain)
//    .navigationTitle("SwiftUI apps")
//    .navigationBarTitleDisplayMode(.inline)
//    .navigationDestination(for: NavigationItem.self) { item in
//        switch item.menu {
//        case .compass:
//            CompassView()
//        case .card:
//            CardReflectionView()
//        case .charts:
//            ChartView()
//        case .radial:
//            RadialLayoutView()
//        case .halfsheet:
//            HalfSheetView()
//        case .gooey:
//            GooeyView()
//        case .actionbutton:
//            ActionButtonView()
//        }
//    }
//}
//
//
