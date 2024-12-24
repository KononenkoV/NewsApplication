import Foundation

final class VKPostsManager {
    
    private let storageManager = StorageManager.shared
    private let publicId = "22586468"
//    -222251367 - это сообщество
    lazy var token: String  = {
        self.storageManager.token
    }()

//    Запрос позволяет узнать id текущего пользователя
//    private func getUserId(completion: @escaping (String?) -> ()) {
//        var urlComponents = URLComponents()
//        urlComponents.scheme = "https"
//        urlComponents.host = "api.vk.com"
//        urlComponents.path = "/method/users.get"
//        
//        urlComponents.queryItems = [
//            URLQueryItem(name: "access_token", value: token),
//            URLQueryItem(name: "v", value: "5.131")
//        ]
//        
//        guard let url = urlComponents.url else {
//            completion(nil)
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard error == nil else {
//                print(error!.localizedDescription)
//                completion(nil)
//                return
//            }
//            guard let data = data else {
//                completion(nil)
//                return
//            }
//            
//            do {
//                let userResponse = try JSONDecoder().decode([VKUser].self, from: data)
//                completion(userResponse.first?.id)
//            } catch {
//                completion(nil)
//            }
//        }.resume()
//    }
//
//    struct VKUser: Decodable {
//        var id: String
//    }
    
    
    private func createRequest(path: String) -> URLRequest?{
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/\(path)"
        
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "v", value: "5.131"),
            URLQueryItem(name: "owner_id", value: publicId),
            URLQueryItem(name: "count", value: "20"),
        ]
        
        guard let url = urlComponents.url else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        return request
    }
    
    func sendRequest(completion: @escaping (VKObject)->()){
        guard
            let request = createRequest(path: VKUrl.wall.rawValue)
        else { return }
        
        URLSession.shared.dataTask(with: request) { data, responce, err in
            guard err == nil else {
                print(err!.localizedDescription)
                return
            }
            guard let postData = data else { return }
            
            do {
                let responce = try JSONDecoder().decode(VKObject.self, from: postData)
                completion(responce)
                
            } catch let error{
                print(error.localizedDescription)
            }
        }.resume()
    }
}

enum VKUrl: String{
    case baseUrl = "https://api.vk.com/method/"
    case wall = "wall.get"
}

enum RequestType{
    case vk
}

struct VKObject: Decodable{
    var response: VKResponce
}

struct VKResponce: Decodable{
    var items: [VKResponseItem]
}

struct VKResponseItem: Decodable {
    var text: String
    var attachments: [VKAttachment]?
    var date: Int
}

struct VKAttachment: Decodable{
    var type: String
    var photo: VKPhotoAttachment?
    var video: VKVideoAttachment?
}

struct VKPhotoAttachment: Decodable {
    var sizes: [VKAttachmentImageSize]?
}

struct VKVideoAttachment: Decodable{
    var image: [VKAttachmentImageSize]?
}

struct VKAttachmentImageSize: Decodable{
    var url: String
    var width: Int
    var height: Int
}

