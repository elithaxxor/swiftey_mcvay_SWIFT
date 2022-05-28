import UIKit
import SwiftUI


class persistance_FileSystem {

    var documents = ["one", "two", "three"]
    var name = ""
    @Published private var documentNames = [documents]

    private var autosave: AnyCancellable?

    init(named name: String = "Title") {
        self.name = name
        let defualtKeys = "FS_KEYS.\(name)"
        documentNames = Dictionary(fromPropertyList: UserDefaults.standard.object(forKey: defaultKeys))
    }


    private var directory: URL?

    init(directory: URL) {
        self.name = directory.lastPathComponent
        self.directory = directory
        do {
            let documents = try FileManager.default.contentsOfDirectory(atPath: directory.path)
            for document in documents {
                let newDocument = DocumentStruct(url: direcotry.appendingPathComponent(document))
                self.documentNames[newDocument] = document
            } catch {
                print(error) 
            }
        }
    }

}
