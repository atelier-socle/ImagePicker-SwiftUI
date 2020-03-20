//
//  ImagePickerCoordinator.swift
//  ImagePicker-SwiftUI
//
//  Created by Tom Baranes on 20/03/2020.
//  Copyright © 2020 tbaranes. All rights reserved.
//

import SwiftUI

struct ImagePickerController: UIViewControllerRepresentable {
    let sourceType: UIImagePickerController.SourceType

    @Binding var inputImage: Image?
    @Environment(\.presentationMode) var presentationMode

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let pickerController = UIImagePickerController()
        pickerController.delegate = context.coordinator
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            pickerController.sourceType = sourceType
        }
        return pickerController
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {

    }

    func makeCoordinator() -> ImagePickerCoordinator {
        Coordinator(self)
    }
}
