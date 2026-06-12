# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

-dontwarn vkey.android.vos.*
-dontwarn com.vkey.**
-dontwarn vkey.android.**
-keep class vkey.android.vos.** { *; }
-keep class com.vkey.** { *; }
-keep class vkey.android.** { *; }

-dontwarn com.abl.*
-keep class com.abl.** { *; }
-dontwarn com.nets.*
-keep class com.nets.** { *; }

# for whitecryption
-dontwarn com.whitecryption.*
-keep class com.whitecryption.** { *; }

# for whitecryption
-keep @interface com.whitecryption.annotation.*
-keepattributes RuntimeInvisibleAnnotations
-keepclassmembers @interface com.whitecryption.annotation.* { public *; }

# for retrofit
-keep class retrofit.** { *; }
-keepclasseswithmembers class * {
    @retrofit.http.* <methods>;
}
-keep class sun.misc.Unsafe { *; }

# For okhttp
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }
-dontwarn okhttp3.**

-keep class okio.** { *; }

# For spongycastle
-keep class org.spongycastle.x509.** { *; }
-dontwarn org.spongycastle.x509.**
-keep class org.spongycastle.** { *; }
-dontwarn org.spongycastle.**

