# Bluetooth Connection Flow
The Bluetooth Connection Flow is a Swift iOS application that allows users to search for nearby Bluetooth devices, show a list of found nearby Bluetooth devices, and display alert messages regarding any errors/expectations. This project follows the MVVM architecture pattern and is built with Swift UI.

## Requirements
1. iOS 13.0 or higher.
2. Xcode 14 or higher.
3. Swift 5.0 or higher.

## Installation
1. Clone the repository to your local machine using Git:
2. Open the project in Xcode.
3. Build and run the application on physical device.

## Usage

- Launch the application.
- The application will start searching for nearby Bluetooth devices.
- If the Bluetooth on the iOS device is turned off, the app will display an alert message to the user prompting them to enable Bluetooth in the device's Settings.
- Once a device is found, it will be displayed in a list view.
- If no devices are found, a message will be displayed.
- If there are any errors an error message is will be displayed.



## Technical Details
- The project is written in Swift 5.0.
- It uses Core Bluetooth framework to search for nearby devices.
- Apple Combine is used to handle asynchronous operations and manage state.
- The UI is built using Swift UI.


## Architecture

This project uses the Model-View-ViewModel (MVVM) architecture pattern. The BlutoothScannerViewModel handles the business logic for searching for nearby Bluetooth devices, while the ContentView handles the presentation logic. The CBCentralManager is responsible for scanning for nearby Bluetooth devices using Core Bluetooth.

#### Architectural Decisions and considerations for this project:

##### Use of MVVM framework 
MVVM, or Model-View-ViewModel, is a design pattern that is  used to achieve **Separation of Concerns**: MVVM separates the concerns of the user interface, business logic, and data model, making the code **easier to maintain, test, and modify**.

### Use of Apple Combine with core bluetooth framework 

-** Simplified data management:** Core Bluetooth is an asynchronous data stream, and Combine provides a declarative way to manage those streams. By using Combine, you can simplify the code that manages the data from Core Bluetooth and make it more readable and easier to understand.

-** Error handling:** Combine provides a powerful error-handling mechanism that helps you to handle errors in a consistent and efficient way, reducing the likelihood of crashes or other unexpected behaviours. This is particularly important when working with Bluetooth, as there are many potential errors that can occur.

-** Integration with SwiftUI:** Combine is tightly integrated with Apple's SwiftUI framework, which allows you to create user interfaces that respond to changes in the underlying data. This makes it easier to build complex UIs and manage data flow between your app's various components.


####  Use of Swift UI 
Swift UI is a relatively light weight framework and provides various advantages 
- **Declarative Syntax: **SwiftUI uses a declarative syntax that makes it easier to read, understand and write code. 
- **Live Preview:** SwiftUI provides a live preview feature that allows developers to see their changes in real-time as they make them.
- **Combine:** SwiftUI works seamlessly with Apple Combine framework
