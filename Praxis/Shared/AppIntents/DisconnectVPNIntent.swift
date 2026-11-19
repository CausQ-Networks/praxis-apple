import AppIntents

nonisolated struct DisconnectVPNIntent: AppIntent {
    static var title: LocalizedStringResource = "Disconnect Praxis"
    static var description = IntentDescription("Disables the Praxis VPN connection.")
    static var openAppWhenRun: Bool = false
    static var authenticationPolicy: IntentAuthenticationPolicy = .requiresAuthentication

    @MainActor
    func perform() async throws -> some IntentResult & ProvidesDialog {
        let (tunnelManager, _, _) = try AppDependencies.shared.requireManagers()

        await tunnelManager.disconnect()
        let finalStatus = await tunnelManager.waitUntilSettled()

        return .result(dialog: "Praxis: \(finalStatus.displayText).")
    }
}
