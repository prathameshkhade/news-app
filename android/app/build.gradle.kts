plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "dev.prathameshkhade.news"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "dev.prathameshkhade.news"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        release {
            if (System.getenv("KEY_PATH") != null) {
                storeFile = file(System.getenv("KEY_PATH"))
                storePassword = System.getenv("KEY_STORE_PASSWORD")
                keyAlias = System.getenv("ALIAS")
                keyPassword = System.getenv("KEY_PASSWORD")
            } else if (keystorePropertiesFile.exists()) {
                keyAlias = keystoreProperties['keyAlias']
                keyPassword = keystoreProperties['keyPassword']
                storeFile = file(keystoreProperties['storeFile'])
                storePassword = keystoreProperties['storePassword']
            }
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.release
        }
    }
}

flutter {
    source = "../.."
}

// ABI-specific version code configuration
ext.abiCodes = ["x86_64": 1, "armeabi-v7a": 2, "arm64-v8a": 3]
import com.android.build.OutputFile
android.applicationVariants.all { variant ->
    variant.outputs.each { output ->
        def abiVersionCode = project.ext.abiCodes.get(output.getFilter(OutputFile.ABI))
        if (abiVersionCode != null) {
            output.versionCodeOverride = variant.versionCode + abiVersionCode
        }
    }
}