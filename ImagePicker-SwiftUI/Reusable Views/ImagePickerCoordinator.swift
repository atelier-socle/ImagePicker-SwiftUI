//
//  ImagePickerCoordinator.swift
//  ImagePicker-SwiftUI
//
//  Created by Tom Baranes on 20/03/2020.
//  Copyright © 2020 tbaranes. All rights reserved.
//

import SwiftUI

final class ImagePickerCoordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var parent: ImagePickerController

    init(_ control: ImagePickerController) {
        self.parent = control
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let uiImage = info[.originalImage] as? UIImage {
            parent.inputImage = Image(uiImage: uiImage)
        }
        dismiss()
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss()
    }

    private func dismiss() {
        parent.presentationMode.wrappedValue.dismiss()
    }
}

