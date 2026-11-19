import SwiftUI

struct AboutView: View {
    private var appVersion: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
    }
    
    private var buildNumber: String {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "Unknown"
    }
    
    private var copyright: String {
        let year = Calendar.current.component(.year, from: Date())
        return "© \(year) CausQ, Inc."
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("\(appVersion) (\(buildNumber))")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Text("Copyright")
                        Spacer()
                        Text(copyright)
                            .foregroundColor(.secondary)
                    }
                } header: {
                    Text("Application")
                }
                
                Section {
                    Link(destination: URL(string: "https://docs.praxis.causq.com/")!) {
                        HStack {
                            Text("Documentation")
                            Spacer()
                            Image(systemName: "arrow.up.forward")
                                .foregroundColor(.secondary)
                                .font(.caption)
                        }
                    }
                    
                    Link(destination: URL(string: "https://docs.praxis.causq.com/about/how-praxis-works")!) {
                        HStack {
                            Text("How Praxis Works")
                            Spacer()
                            Image(systemName: "arrow.up.forward")
                                .foregroundColor(.secondary)
                                .font(.caption)
                        }
                    }
                } header: {
                    Text("Documentation")
                }
                
                Section {
                    Link(destination: URL(string: "https://praxis.net/tos")!) {
                        HStack {
                            Text("Terms of Service")
                            Spacer()
                            Image(systemName: "arrow.up.forward")
                                .foregroundColor(.secondary)
                                .font(.caption)
                        }
                    }
                    
                    Link(destination: URL(string: "https://praxis.net/privacy")!) {
                        HStack {
                            Text("Privacy Policy")
                            Spacer()
                            Image(systemName: "arrow.up.forward")
                                .foregroundColor(.secondary)
                                .font(.caption)
                        }
                    }
                } header: {
                    Text("Legal")
                }
            }
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
