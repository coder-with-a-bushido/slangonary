package com.example.slanganory

import android.content.Intent
import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.app.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity: io.flutter.embedding.android.FlutterActivity() {
    

//    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
//       GeneratedPluginRegistrant.registerWith(flutterEngine)

//        MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
//            }

//       }

    }

class CountTextActivity : FlutterActivity(){
    companion object {
        const val CHANNEL = "com.flutter.textselectaction"
    }


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val channel = MethodChannel(flutterView, CHANNEL)
        //setContentView(R.layout.activity_count_text)

        if (intent.action == Intent.ACTION_PROCESS_TEXT) {

            val selectedText = intent.getStringExtra(Intent.EXTRA_PROCESS_TEXT) ?: ""

            channel.invokeMethod("copiedText", selectedText)


        }

    }
}