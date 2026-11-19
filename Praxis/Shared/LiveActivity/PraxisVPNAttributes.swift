import ActivityKit
import Foundation

nonisolated struct PraxisVPNAttributes: ActivityAttributes {
    nonisolated struct ContentState: Codable, Hashable {
        var statusText: String
    }

    var organizationName: String
}
