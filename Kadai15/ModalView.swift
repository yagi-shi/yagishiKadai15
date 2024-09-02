import SwiftUI

struct ModalView: View {
    @State var newFruit: String = ""
    @Environment (\.presentationMode) var presentation
    var onSave: (String) -> Void = { (name: String) -> Void in }

    var body: some View {
        NavigationStack {
            HStack {
                Text("名前")
                TextField("", text: $newFruit)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)
            }
            .offset(x: 0, y: 50)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        presentation.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        if !newFruit.isEmpty {
                            onSave(newFruit)
                        }
                        presentation.wrappedValue.dismiss()
                    }
                }
            }

            Spacer(minLength: 50)
        }
    }
}
