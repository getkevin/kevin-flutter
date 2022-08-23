public class JsonParser {
    public static func parseToObject<T: Codable>(data: [String: Any?]) throws -> T {
        let json = try JSONSerialization.data(withJSONObject: data)
        let result = try JSONDecoder().decode(T.self, from: json)
        return result
    }
    
    public static func parseToJsonString<T: Codable>(data: T) throws -> String {
        let json = try JSONEncoder().encode(data)
        let jsonString = String(decoding: json, as: UTF8.self)
        return jsonString
    }
}