"Flutter Firebase App: User Authentication, File Storage & Display, Real-Time Messaging, and Notifications"

Overview
This Flutter app leverages Firebase to create a comprehensive experience that includes user authentication, file storage, messaging, and real-time notifications. Firebase Authentication is used to securely manage user accounts and provide a seamless login experience. Beyond authentication, the app integrates Firebase Cloud Storage, allowing users to upload additional data and files directly from the app. These uploaded files are then stored securely and are available for display within the app’s interface.

In addition to file management, the app uses Firebase Cloud Firestore as a reliable database for storing and retrieving real-time messages. This enables users to exchange messages that are stored directly in Firebase, ensuring data persistence and easy access across devices. Each time a new message arrives, Firebase Cloud Messaging (FCM) is used to trigger a notification, alerting users instantly to new activity within the app.

Together, these features create a full-featured application that provides a seamless and responsive experience for users, making it easy to authenticate, store, display files, and stay connected through real-time messaging and notifications.

Screenshots
Login Screen
The login screen of the app, where users can enter their account information and password to access the app. Integrated with Firebase Authentication, it provides a secure and reliable login experience for users.

Registration Screen
New users can create an account by filling out the registration form. Once completed, the account is securely stored in Firebase, ensuring data safety and easy user data management.

Chat Channel
The chat interface allows users to exchange messages in real-time. Messages are stored directly in Firebase Firestore, ensuring that all conversations are saved and accessible from multiple devices.

New Message Notification
When the app runs in the background, Firebase Cloud Messaging (FCM) sends a notification to the user’s device if a new message arrives. This keeps users updated, ensuring they never miss any important messages even when the app is not open.


![Screenshot 2024-10-31 180951](https://github.com/user-attachments/assets/69df0108-dbc7-483c-81f3-bbd0cc1ae254)
![Screenshot 2024-10-31 180946](https://github.com/user-attachments/assets/970d0632-3271-41b3-a041-0818fac495b9)
![Screenshot 2024-10-31 180907](https://github.com/user-attachments/assets/fc74cad4-b80d-4aa9-982a-f62a5ea4cf0a)
![Screenshot 2024-10-31 180008](https://github.com/user-attachments/assets/3f503a6b-3937-439c-a952-92bf2e70e828)


