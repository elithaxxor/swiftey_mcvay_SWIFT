//
//  CustomCameraView.swift
//  AVCamera_Sessions
//
//  Created by a-robota on 5/3/22.
//

import Foundation
import SwiftUI

struct CustomCameraView: View {
    
    let cameraService = cameraService()
    @Binding var capturedImage: UIImage?
    @Enviroment(\.presentationMode) private var presentationMode
    
    var body: some View {
        ZStack {
            
            
            if capturedImage != nil {
                CameraView(cameraService: cameraService) { result in
                    switch result {
                    case .success(let photo):
                        if let data = photo.fileDataRepresentation() {
                            captureImage = UIImage(data: data)
                            presentationMode.wrappedValue.dismiss()
                        } else {
                            print("no image in data")
                        }
                    case.failure let err {
                        print("case failure \(err) ")
                    }
                    }
                }
                VStack {
                    
                    Spacer()
                    Button(action: {
                        cameraService.CapturePhoto()
                    }, label:  {
                        Image(systemName: "circle" )
                            .font(.system(size: 72))
                            .foreground(.white)
                            .background(Color.black)
                            .clipShape(Circle())
                        
                    })
                    .padding(.bottom)
                    .sheet(isPresented: $isCustomCameraViewPresented, content: {
                        CustomCameraView(capturedImage: $capturedImage )
                    })
                }
            }
        }
    }
