import SwiftUI
import WidgetKit

@main
struct PraxisLiveActivityBundle: WidgetBundle {
    var body: some Widget {
        PraxisVPNLiveActivity()
        PraxisVPNWidget()
        PraxisVPNControl()
    }
}
