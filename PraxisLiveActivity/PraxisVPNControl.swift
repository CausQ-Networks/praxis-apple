import AppIntents
import SwiftUI
import WidgetKit

struct PraxisVPNControl: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: VPNWidgetStatusStore.controlKind,
            provider: PraxisVPNControlValueProvider()
        ) { isOn in
            ControlWidgetToggle(
                "Connect Praxis",
                isOn: isOn,
                action: TogglePraxisVPNControlIntent()
            ) { isOn in
                Label(
                    isOn ? "Connected" : "Disconnected",
                    image: "PraxisSymbol"
                )
            }
        }
        .displayName("Connect Praxis")
        .description("Connect or disconnect Praxis.")
    }
}

struct PraxisVPNControlValueProvider: ControlValueProvider {
    var previewValue: Bool { false }

    func currentValue() async throws -> Bool {
        VPNWidgetStatusStore.read().showsDisconnectButton
    }
}
