class NetworkManager {
    private var currentRequest: DispatchWorkItem?

    func fetchData(completion: @escaping (Result<[String], Error>) -> Void) {
        currentRequest?.cancel()
        let request = DispatchWorkItem {
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                if Bool.random() {
                    completion(.success(["data1", "data2"]))
                } else {
                    completion(.failure(NSError(domain: "com.example", code: -1, userInfo: nil)))
                }
            }
        }
        currentRequest = request
        DispatchQueue.global().async(execute: request)
    }
}