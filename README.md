# Architecture Overview

This project follows **Clean Architecture + MVVM** using SwiftUI.

---

# Architecture Flow

View → ViewModel → UseCase → Repository → API/Data Source

---

# Layers Explanation

## 1. Presentation Layer

Contains:
- SwiftUI Views
- ViewModels

Example:
- `ContentView`
- `DetailView`
- `PostViewModel`

Responsibilities:
- Displays UI
- Handles user interaction
- Observes state changes
- Calls ViewModel methods

---

## 2. ViewModel

Acts as a bridge between UI and business logic.

Example:
- `PostViewModel`

Responsibilities:
- Fetches data using UseCase
- Manages loading/error states
- Updates UI using `@Published`
- Keeps Views lightweight

---

## 3. Domain Layer

Core business layer of the app.

Contains:
- Models
- UseCases
- Repository protocols

Example:
- `Post`
- `FetchPostsUseCase`
- `PostRepository`

Responsibilities:
- Defines business rules
- Independent of SwiftUI/UIKit
- Most reusable and testable layer

---

## 4. UseCase Layer

Contains app-specific business logic.

Example:
- `FetchPostsUseCase`

Responsibilities:
- Executes specific actions
- Communicates with Repository
- Keeps ViewModel clean

---

## 5. Repository Layer

Acts as abstraction between Domain and Data layers.

Example:
- `PostRepository`
- `PostRepositoryImpl`

Responsibilities:
- Decides data source
- Handles API/local/cache logic
- Keeps data handling centralized

---

## 6. Data Layer

Handles external data sources.

Contains:
- API calls
- Network monitoring
- Security services

Example:
- `APIService`
- `NetworkMonitor`
- `JailbreakService`

Responsibilities:
- Fetch remote/local data
- Handle networking
- Device/security checks

---

# Network Monitoring

Implemented using:
- `NWPathMonitor`

Responsibilities:
- Detect internet availability
- Prevent unnecessary API calls
- Improve retry handling

---

# Security

Implemented:
- Jailbreak Detection

Responsibilities:
- Detect compromised devices
- Improve application security

---

# Navigation

Implemented using:
- `NavigationStack`

Benefits:
- Modern SwiftUI navigation
- Type-safe navigation
- Better scalability

---

# Testing

Includes:
- Unit Tests
- UI Tests

Coverage:
- ~80%+ coverage

Tested Layers:
- ViewModel
- Repository
- UseCase
- Navigation flow

---

# Dependency Injection

Dependencies are injected from:
- `MyApp.swift`

Benefits:
- Loose coupling
- Better testability
- Easier mocking

---

# SwiftLint

Used for:
- Code style consistency
- Safer Swift practices
- Better maintainability

---

# Project Highlights

- SwiftUI
- MVVM
- Clean Architecture
- Async/Await
- API Integration
- NavigationStack
- Network Monitoring
- Jailbreak Detection
- Unit Testing
- SwiftLint
- Dependency Injection


--Have followed clean architecture for entire app.

--Screen shot of UI-
<img width="1179" height="2556" alt="Simulator Screenshot - iPhone 15 - 2026-05-06 at 21 58 39" src="https://github.com/user-attachments/assets/6fbc0470-b85d-4b49-b7f8-1abcb4641a1a" />
<img width="1179" height="2556" alt="Simulator Screenshot - iPhone 15 - 2026-05-06 at 21 58 25" src="https://github.com/user-attachments/assets/54a963e6-c127-48bb-b20d-04ea2d650f1f" />


4-UT covergae-
<img width="782" height="297" alt="Screenshot 2026-05-07 at 3 45 09 PM" src="https://github.com/user-attachments/assets/cbadd2e3-f568-46c8-8185-06a9ab6787d7" />
