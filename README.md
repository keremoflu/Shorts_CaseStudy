# Shorts - Case Study
Shorts - Drama App. Luni Case Study

![Swift](https://img.shields.io/badge/Swift-6.2-orange?logo=swift&logoColor=white)
![Xcode](https://img.shields.io/badge/Xcode-26.2-blue?logo=xcode&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-17%2B-green?logo=apple&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-Framework-purple?logo=swift&logoColor=white)

## Overview

Shorts is a **mobile drama streaming app** featuring 2 screens. The app delivers **short-form vertical video content** with a modern, immersive viewing experience across a variety of genres.

## Key Features
- **Homepage** — Carousel, Continue Watching, Coming Soon, Most Trending, Only on Shorts, Top Picks, New on Shorts
- **Series Detail** — Full-bleed cover, series info, expandable description, cast, and episode grid

## Project Structure
```
ShortsCaseStudy/
├── Localizable
├── CommonModule/
├── ShortsCaseStudy/
│   ├── App/
│   ├── Core/
│   │   ├── Data/
│   │   ├── Extension/
│   │   ├── Helper/
│   │   ├── Manager/
│   │   ├── Model/
│   │   ├── Navigation/
│   │   ├── Screen/
│   │   ├── Service/
│   │   └── Store/
│   ├── Design/
│   │   ├── ButtonStyle/
│   │   ├── Size/
│   │   ├── View/
│   │   ├── ViewModifiers/
│   │   └── ViewStyle/
│   ├── Resources/
│   │   ├── Assets
│   │   └── Info
```

## Tech Stack
* SwitfUI
* MVVM
* iOS 17+ minimum deployment

## Data Layer

The app uses a local `series_catalog.json` file as its data source. A **mock API service** wraps this JSON and exposes it through **async/await**, simulating real network calls.

## Duration
* Preparing Assets: Colors, Fonts ~ 2-3 hours
* Building App: ~ 13-15 hours

## Localization

`Localizable.strings` : The app supports **2 languages** except English with a total of 20 localized strings.

| Language | Code | Strings |
|----------|------|---------|
| Turkish  | `tr` | 20      |
| French   | `fr` | 20      |

## Contact
keremofluvideo@gmail.com

