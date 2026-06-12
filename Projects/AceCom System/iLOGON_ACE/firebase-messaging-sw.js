// Give the service worker access to Firebase Messaging.
// Note that you can only use Firebase Messaging here. Other Firebase libraries
// are not available in the service worker.
importScripts('https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js');

// Initialize the Firebase app in the service worker by passing in
// your app's Firebase config object.
// https://firebase.google.com/docs/web/setup#config-object
firebase.initializeApp({
    apiKey: "AIzaSyBUeXJ6jW-h-1H6JGuYUHK7gjQwtgVknkU",
    authDomain: "grand-boulder-202209.firebaseapp.com",
    databaseURL: "https://grand-boulder-202209.firebaseio.com",
    projectId: "grand-boulder-202209",
    storageBucket: "grand-boulder-202209.appspot.com",
    messagingSenderId: "953079188383",
    appId: "1:953079188383:web:bf3a6b8a0dac7fa72a0baa",
    measurementId: "G-47PWNW532V"
});

// Retrieve an instance of Firebase Messaging so that it can handle background
// messages.
const messaging = firebase.messaging();

