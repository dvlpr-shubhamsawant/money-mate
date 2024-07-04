
# Money Mate

Moneymate is a Flutter application designed to help you manage your daily expenses. It uses Hive for local data storage and local notifications to remind you to use the app daily. The app allows you to create, read, update, and delete daily expenses efficiently.


## Features

- **Create Expenses:** Add new daily expenses with ease.
- **Read Expenses:** View a list of all your expenses.
- **Update Expenses:** Edit your existing expenses.
- **Delete Expenses:** Remove expenses that are no longer needed.
- **Daily Notifications:** Get daily reminders to update your expenses.


## Setup

- git clone https://github.com/yourusername/moneymate.git
- cd moneymate


## Deployment



- open with vs code / android studio
- open terminal and run flutter pub get
- run 'flutter run'
### License

Here's an outline and example content for your report:

```markdown
# Moneymate - Report

## Introduction

This report explains the design decisions, architectural choices, and testing approach used in the Moneymate project, a Flutter application for managing daily expenses with local notifications and Hive-based local storage.

## Design Decisions

1. **Plugin Selection:**
   - `flutter_local_notifications`: Chosen for its comprehensive support across both iOS and Android platforms and ease of use.
   - `hive`: Selected for its performance and simplicity as a lightweight key-value database for Flutter.

2. **User Experience:**
   - A straightforward interface for managing expenses, ensuring that users can easily add, view, update, and delete expenses.
   - Daily notifications to remind users to keep their expense records up to date.

## Architectural Choices

1. **Data Storage with Hive:**
   - Hive is used for local data storage due to its efficient, lightweight, and no-SQL nature. It allows for quick read and write operations, which is ideal for a mobile app.

2. **Local Notifications:**
   - The `flutter_local_notifications` plugin is initialized in the `main.dart` file, ensuring it's ready before the app starts. This includes setting up platform-specific initialization settings and handling notification interactions.

3. **Platform-Specific Code:**
   - iOS-specific configurations are handled in Xcode and the `Info.plist` file to support background modes and push notifications.
   - Android-specific configurations are managed in the `AndroidManifest.xml` file.

## Testing Approach

1. **Manual Testing:**
   - Performed on real iOS and Android devices to ensure notifications and data storage functionalities work correctly.

2. **Functional Testing:**
   - Verified that expenses can be created, read, updated, and deleted.
   - Tested the notification permission request flow and ensured notifications are displayed correctly.

3. **Edge Cases:**
   - Handled cases where notification permissions are denied.
   - Verified the app's behavior when it is in different states: foreground, background, and terminated.

## Conclusion

Moneymate is a robust application for managing daily expenses, leveraging Hive for local data storage and flutter_local_notifications for timely reminders. Future enhancements could include more advanced features like expense categorization, detailed reporting, and cloud synchronization.
