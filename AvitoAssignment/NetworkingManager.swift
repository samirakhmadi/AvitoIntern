import Foundation

class NetworkingManager {
    
    static let shared = NetworkingManager()
    
    private init() {}
    
    func fetchData(complitionHandler: @escaping (AvitoModel) -> Void ) {
        
        guard let url = URL(string: "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            do {
                let jsonData = try JSONDecoder().decode(AvitoModel.self, from: data)
                complitionHandler(jsonData)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
