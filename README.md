
# Glam Gas

Glam Gas is a Flutter mobile application designed to provide users with a seamless experience for purchasing appliances, registering complaints, and registering products. This app has been developed with scalability in mind, using the **Provider** architecture for state management, and incorporating a modern, responsive UI with smooth transitions and animations.

## Features

### 1. **Buy Appliances**
Users can directly navigate to the official Glam Gas website to explore and purchase a variety of appliances. The app provides a direct link to the website, making it easy for users to access and complete their purchases.

### 2. **Register Complaint**
This feature allows users to lodge complaints about any product they've purchased. The form includes fields for user details, product information, and complaint type, with proper validation for each field. Once submitted, the complaint is sent to the backend API for processing.

### 3. **Register Product**
Users can register their purchased products by submitting relevant details like their product category, barcode, and contact information. The information is securely sent to the backend API for product registration.

## Tech Stack

- **Flutter**: The app is built entirely using Flutter for cross-platform support on both Android and iOS.
- **Provider**: Used for state management to ensure scalability and easy management of UI state.
- **Dio**: For handling API requests and ensuring robust network interactions.
- **url_launcher**: For opening external links, such as the Glam Gas website.
- **intl**: For date and time formatting.

## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/glamgas.git
    cd glamgas
    ```

2. Install dependencies:
    ```bash
    flutter pub get
    ```

3. Run the app on your desired platform (Android/iOS):
    ```bash
    flutter run
    ```

## Project Structure

The project follows a modular structure to ensure scalability and maintainability:

```plaintext
lib/
├── main.dart                # Entry point of the app
├── providers/
│   └── app_provider.dart     # Provider for managing app state
├── screens/
│   ├── home_screen.dart      # Home page with links to Buy Appliances, Register Complaint, and Register Product
│   └── register_complaint.dart # Complaint registration form
│   └── register_product.dart   # Product registration form
├── widgets/
│   └── custom_widgets.dart   # Any reusable widgets used across the app
```

### Key Files:
- **main.dart**: Initializes the app, manages routing, and integrates the Provider.
- **app_provider.dart**: Handles the app-wide state.
- **home_screen.dart**: Displays the homepage with buttons to navigate to other parts of the app.
- **register_complaint.dart & register_product.dart**: Forms for complaint and product registration respectively.

## Assets

- **Logo**: The app displays the company logo on the homepage, as well as a subtle background image of the logo with reduced opacity to enhance the UI.
- **PNG Background**: The app includes a large semi-transparent background image to provide visual contrast.

## How It Works

1. **Home Screen**: 
   - Presents three main actions: **Buy Appliances**, **Register Complaint**, and **Register Product**. 
   - The **Buy Appliances** button links directly to the Glam Gas website using `url_launcher`.

2. **Complaint Registration**: 
   - Users can register complaints by filling in the form with details like customer name, product category, and complaint description.
   - The form validates input and submits data using the `Dio` package to send requests to a backend API.

3. **Product Registration**: 
   - Similar to the complaint registration, users can register their purchased products using a form.
   - Product details including barcode and category are sent to the backend.

## Dependencies

The following packages are used:

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.4
  dio: ^5.0.3
  url_launcher: ^6.0.20
  intl: ^0.18.0
```

## Future Improvements

- **Push Notifications**: Add support for real-time notifications when complaints are resolved or product warranties are about to expire.
- **Offline Support**: Implement offline caching for registering complaints and products when there is no network connectivity.
- **Dark Mode**: Support for dark mode to improve accessibility.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
