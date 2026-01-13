import SwiftUI
import AtollExtensionKit

struct ContentView: View {
    @State private var descriptorValid = false
    @State private var logMessages: [String] = ["AtollExtensionKit version: \(AtollExtensionKitVersion)"]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Atoll Sample App")
                .font(.largeTitle)
            Text(logMessages.joined(separator: "\n"))
                .font(.system(size: 13, weight: .regular, design: .monospaced))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(12)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            HStack {
                Button("Validate Descriptor") {
                    validateDescriptor()
                }
                Button("Ping Client") {
                    pingClient()
                }
            }
            .buttonStyle(.borderedProminent)
            Text(descriptorValid ? "Descriptor is valid" : "Descriptor not validated yet")
                .font(.callout)
                .foregroundStyle(descriptorValid ? .green : .secondary)
            Spacer()
        }
        .padding(24)
        .frame(minWidth: 420, minHeight: 320)
    }

    private func appendLog(_ text: String) {
        logMessages.append(text)
    }

    private func validateDescriptor() {
        let descriptor = AtollLiveActivityDescriptor(
            id: UUID().uuidString,
            title: "Sample Activity",
            subtitle: "Demo",
            leadingIcon: .symbol(name: "star.fill", size: 16)
        )
        descriptorValid = descriptor.isValid
        appendLog("Validated descriptor: \(descriptor.isValid)")
    }

    private func pingClient() {
        let client = AtollClient.shared
        appendLog("Client resolved: \(client)")
    }
}

#Preview {
    ContentView()
}
