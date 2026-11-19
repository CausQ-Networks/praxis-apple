# [Praxis](https://praxis.causq.com) Client for Apple Devices

<div align="center">
  <a href="https://praxis.causq.com/">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/CausQ-Networks/praxis/main/public/logo/praxis-logo-white.png">
      <img alt="Praxis Logo" src="https://raw.githubusercontent.com/CausQ-Networks/praxis/main/public/logo/praxis-logo.png" width="280">
    </picture>
  </a>
</div>

[![Discord](https://img.shields.io/discord/1572896060949659679?logo=discord&style=flat-square&label=Discord)](https://praxis.causq.com/discord/)

This is the official Praxis client with GUI for Apple devices (macOS + iOS/iPadOS).

**Status:** signed installers are not published yet. [GitHub Releases](https://github.com/CausQ-Networks/praxis-apple/releases) has no DMG/IPA assets, and there is no Praxis App Store listing. Building a Network Extension client requires an Apple Developer team and signing certificates.

This client can be used with both:

- [Praxis Cloud](https://app-praxis.causq.com/auth/login) - Quickest and easiest way to get started using Praxis.
- [Self-hosted Praxis](https://docs-praxis.causq.com/self-host/quick-install) - Fully self-hosted Community and Enterprise editions of Praxis.

## Download & Install

- [macOS download status](https://praxis.causq.com/downloads/mac) — DMG not available yet
- [iOS download status](https://praxis.causq.com/downloads/ios) — App Store / TestFlight not published yet
- [Releases](https://github.com/CausQ-Networks/praxis-apple/releases) — will host DMG/IPA artifacts once signed builds are produced

## Compatibility

- Compatible with macOS 14+
- Compatible with iOS/iPadOS 17+

## Documentation

- Documentation for the macOS client can be found at [docs-praxis.causq.com](https://docs-praxis.causq.com/manage/clients/install-client#mac).
- Documentation for the iOS/iPadOS client can be found at [docs-praxis.causq.com](https://docs-praxis.causq.com/manage/clients/install-client#ios).

## Publishing a signed macOS DMG

A GitHub Actions workflow [`.github/workflows/macos-release.yml`](.github/workflows/macos-release.yml) builds, signs, packages a DMG, and publishes a GitHub Release.

Add these repository secrets (Settings → Secrets and variables → Actions), then run **Actions → macOS Release → Run workflow**:

| Secret | Purpose |
| --- | --- |
| `APPLE_CERTIFICATE_P12_BASE64` | Base64-encoded Developer ID Application `.p12` (Network Extension capable) |
| `APPLE_CERTIFICATE_PASSWORD` | Password for the `.p12` |
| `APPLE_TEAM_ID` | Apple Team ID (e.g. `4668XHFAHF`) |
| `APPLE_API_KEY_ID` / `APPLE_API_ISSUER_ID` / `APPLE_API_KEY_P8_BASE64` | Optional; for notarization via App Store Connect API |

Without those secrets the workflow exits early and no Release asset is created. Local machines without a codesigning identity cannot produce a distributable DMG.

