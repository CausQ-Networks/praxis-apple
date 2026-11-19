import AppIntents

nonisolated struct ConnectVPNIntent: AppIntent {
    static var title: LocalizedStringResource = "Connect Praxis"
    static var description = IntentDescription("Enables the Praxis VPN connection.")
    static var openAppWhenRun: Bool = false
    static var authenticationPolicy: IntentAuthenticationPolicy = .requiresAuthentication

    @MainActor
    func perform() async throws -> some IntentResult & ProvidesDialog {
        let (tunnelManager, authManager, _) = try AppDependencies.shared.requireManagers()

        await AppDependencies.shared.ensureAuthLoaded()

        guard authManager.isAuthenticated else {
            throw PraxisIntentError.notLoggedIn
        }
        guard authManager.currentOrg != nil else {
            throw PraxisIntentError.noOrganizationSelected
        }

        await tunnelManager.connect()
        let finalStatus = await tunnelManager.waitUntilSettled()

        if let error = tunnelManager.lastConnectionError {
            throw PraxisIntentError.connectionFailed(error)
        }
        guard finalStatus == .connected else {
            throw PraxisIntentError.connectionFailed("Praxis didn't finish connecting.")
        }

        return .result(dialog: "Praxis: Connected.")
    }
}
