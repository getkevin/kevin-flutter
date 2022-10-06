-keepattributes *Annotation*, InnerClasses
-dontnote kotlinx.serialization.AnnotationsKt

-keep,includedescriptorclasses class eu.kevin.flutter.**$$serializer { *; }
-keepclassmembers class eu.kevin.flutter.** {
    *** Companion;
}
-keepclasseswithmembers class eu.kevin.flutter.** {
    kotlinx.serialization.KSerializer serializer(...);
}
