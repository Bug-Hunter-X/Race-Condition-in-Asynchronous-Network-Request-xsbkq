func fetchData(completion: @escaping (Result<[String], Error>) -> Void) {
    // Simulate network request
    DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
        if Bool.random() {
            completion(.success(["data1", "data2"]))
        } else {
            completion(.failure(NSError(domain: "com.example", code: -1, userInfo: nil)))
        }
    }
}