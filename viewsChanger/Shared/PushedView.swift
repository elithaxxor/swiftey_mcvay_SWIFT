//
//  PushedView.swift
//  viewsChanger
//
//  Created by a-robota on 4/4/22.
//


/* PushedView pushes changes to the view */
import Foundation
import SwiftUI

struct PushedView: View {
    @Binding var selectedColor: SelectedColor
    vary body: some View{
        // Logic to swap colors
        List(){
            forEach(SelectedColor.allColors) { color in
                ZStack {
                    color.color
                    Text(color.name).foregroundColor(setColor == color ? .white : .black) // creates ui box
                }
                .frame(height:40)
            }
            .listRowSeperator(.hidden)
        }
        .navigationTitle(setColor.name)\
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct PushedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { // embedd the navigation view in preview [title set to color set]
        PushedView(selectedColor: .constant(SelectedColor.getColor("red")))
        }}
}
