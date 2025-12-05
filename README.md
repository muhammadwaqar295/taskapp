# TaskApp - Flutter Hashtag Extraction App

A professional Flutter application demonstrating navigation with `go_router` and real-time hashtag extraction from user input.

**/App Flow/
Screen A → Home screen with navigation button
Screen B → Display screen showing extracted data
Screen C → Input screen with real-time hashtag extraction
Type phrase with hashtags (e.g., "#flutter #dart")
Hashtags auto-populate in second field
Submit to view results on Screen B
Back to Screen A → Done button with celebration dialog



## Features

- **Multi-screen Navigation**: Three screens connected with `go_router`
- **Real-time Hashtag Extraction**: Automatically extracts hashtags as user types
- **Dynamic Highlighting**: Hashtags highlighted in distinct color
- **Data Persistence**: Pass extracted data between screens
- **Success Confirmation**: Congratulations dialog on completion

## 🚀 Quick Start

```bash
# Clone and setup
git clone https://github.com/muhammadwaqar295/taskapp.git
cd taskapp
flutter pub get
flutter run
