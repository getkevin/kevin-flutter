-keepattributes *Annotation*, InnerClasses
-dontnote kotlinx.serialization.AnnotationsKt

-keep,includedescriptorclasses class eu.kevin.flutter.payments.**$$serializer { *; }
-keepclassmembers class eu.kevin.flutter.payments.** {
    *** Companion;
}
-keepclasseswithmembers class eu.kevin.flutter.payments.** {
    kotlinx.serialization.KSerializer serializer(...);
}
