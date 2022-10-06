-keepattributes *Annotation*, InnerClasses
-dontnote kotlinx.serialization.AnnotationsKt

-keep,includedescriptorclasses class eu.kevin.flutter.core.**$$serializer { *; }
-keepclassmembers class eu.kevin.flutter.core.** {
    *** Companion;
}
-keepclasseswithmembers class eu.kevin.flutter.core.** {
    kotlinx.serialization.KSerializer serializer(...);
}
