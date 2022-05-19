
import SwiftUI
import CTScanText
// --> change the texr fields ScanTextField, because it is an object inilizer (swfit thing)

// UITextfield and UIKeyboard - custom UI Params.
// @UIApplicationMain



class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var picker: ImagePickerView
    
    init(picker: ImagePickerView) {
        self.picker = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        self.picker.selectedImage = selectedImage
        self.picker.isPresented.wrappedValue.dismiss()
    }
    
}



struct ImagePickerView: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var isPresented
    var sourceType: UIImagePickerController.SourceType
        
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = self.sourceType
        imagePicker.delegate = context.coordinator // confirming the delegate
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {

    }

    // Connecting the Coordinator class with this struct
    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
}


public struct TextEditorScreen: View{
    @State private var name = ""
    @State private var company = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var address = ""
    @State private var website = ""


    public var body: some View{

        VStack {
            
            ScanTextField("Document", text: $name)
                .frame(height: 40)
                .textFieldStyle(.roundedBorder)
                .textContentType(.name)
                .keyboardType(.alphabet)
                //.submitScope()
            

        Form{
            ScanTextField("company", text: $company)
                .frame(height: 15)
                .textContentType(.name)
                .keyboardType(.alphabet)
      
                //.submitScope()
            ScanTextField("email", text: $email)
                .textContentType(.name)
                .keyboardType(.emailAddress) // force proper input
               // .submitScope()
            ScanTextField("phone", text: $phone)
            
                .textContentType(.telephoneNumber)
                .keyboardType(.phonePad) // UI for text / num - force proper input
                
            ScanTextField("address", text: $address)
                .textContentType(.fullStreetAddress) // forc proepr input
                .keyboardType(.default)
            
            ScanTextField("website", text: $website)
                .textContentType(.URL) // forc proepr input
                .keyboardType(.URL)
            
               // .submitScope()
        }
            Spacer()
        }.padding()
        VStack {
  

        }
    }
    
   

}

struct TextEditorScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TextEditorScreen()
    }
}
}

