import UIKit

enum MyResult {
    case success(value: Any)
    case failure(value: Error)
    
    var description: String {
        switch self {
        case .success (let value):
            return "success \(value)"
            
        case .failure (let error):
            return "failure \(error)"
        }
    }
}

struct score {
    private(set) var current: Int = 0
    if current < 1 {

    }
}

let foo = MyResult.success(value: "some string")
print(foo)


class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData(completion:{ result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        })
        
    }
    
    enum myError: Error {
        case someError
    }
    
    func getData(completion: @escaping (Result<Data, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: URL(string: "")!, completionHandler: { data, response, error in
            guard let data = data else {
                completion(.failure(myError.someError))
                return
            }
            completion(.success(data))
        })
        task.resume()
    }
}
