//
//  ContentView.swift
//  ImagePicker-SwiftUI
//
//  Created by Tom Baranes on 19/03/2020.
//  Copyright © 2020 tbaranes. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var isImagePickerShown = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera

    var body: some View {
        VStack (spacing: 50) {
            if image != nil {
                image!.resizable()
                    .frame(width: 300, height: 300)
                    .cornerRadius(40)
            } else {
                Rectangle()
                    .frame(width: 300, height: 300)
                    .cornerRadius(40)
                    .foregroundColor(.gray)
            }

            makeButton(title: "Choose an image", sourceType: .photoLibrary)
            makeButton(title: "Take a picture", sourceType: .camera)
        }.sheet(isPresented: $isImagePickerShown) {
            ImagePickerController(sourceType: self.sourceType, inputImage: self.$image)
        }
    }

    func makeButton(title: String, sourceType: UIImagePickerController.SourceType) -> some View {
        Button(title) {
            self.sourceType = sourceType
            self.isImagePickerShown = true
        }
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
