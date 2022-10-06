-keepattributes *Annotation*, InnerClasses
-dontnote kotlinx.serialization.AnnotationsKt

-keep,includedescriptorclasses class eu.kevin.flutter.accounts.**$$serializer { *; }
-keepclassmembers class eu.kevin.flutter.accounts.** {
    *** Companion;
}
-keepclasseswithmembers class eu.kevin.flutter.accounts.** {
    kotlinx.serialization.KSerializer serializer(...);
}
