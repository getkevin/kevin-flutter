import kevin_ios

public class KevinFlutterErrorParser {
    public static func parseFlutterUnexpectedError(
        error: Error? = nil,
        message: String? = nil
    ) -> FlutterError {
        return parseFlutterError(error: error, defaultCode: KevinErrorCode.unexpected, message: message)
    }
    
    public static func parseFlutterError(
        error: Error? = nil,
        defaultCode: KevinErrorCode = KevinErrorCode.general,
        message: String? = nil
    ) -> FlutterError {
        let errorCode: String
        var errorDescription: String? = nil
        
        switch error {
        case is KevinCancelationError:
            errorCode = KevinErrorCode.cancelled.rawValue
            break
        case is KevinError:
            errorCode = defaultCode.rawValue
            errorDescription = message ?? (error as! KevinError).description
            break
        default:
            errorCode = defaultCode.rawValue
            errorDescription = message ?? error?.localizedDescription
            break
        }
        
        return FlutterError(code: errorCode, message: errorDescription, details: nil)
    }
}
