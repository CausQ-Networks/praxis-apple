import AppIntents

enum PraxisIntentError: Error, CustomLocalizedStringResourceConvertible {
    case notLoggedIn
    case noOrganizationSelected
    case appUnavailable
    case connectionFailed(String)

    var localizedStringResource: LocalizedStringResource {
        switch self {
        case .notLoggedIn:
            return "Please open Praxis and log in first."
        case .noOrganizationSelected:
            return "Please open Praxis and select an organization first."
        case .appUnavailable:
            return "Praxis isn't ready yet. Please open the app and try again."
        case .connectionFailed(let message):
            return LocalizedStringResource(stringLiteral: message)
        }
    }
}
