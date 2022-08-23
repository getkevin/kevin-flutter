import kevin_ios

public class KevinFlutterErrorParser {
    public static func parseFlutterUnexpectedError(error: Error) -> FlutterError {
        return parseFlutterError(error: error, defaultCode: KevinErrorCodes.unexpected)
    }
    
    public static func parseFlutterError(error: Error?, defaultCode: String = KevinErrorCodes.general) -> FlutterError {
        let errorCode: String
        var errorDescription: String? = nil
        
        switch error {
        case is KevinCancelationError:
            errorCode = KevinErrorCodes.cancelled
            break
        case is KevinError:
            errorCode = defaultCode
            errorDescription = (error as! KevinError).description
            break
        default:
            errorCode = defaultCode
            errorDescription = error?.localizedDescription
            break
        }
        
        return FlutterError(code: errorCode, message: errorDescription, details: nil)
    }
}
