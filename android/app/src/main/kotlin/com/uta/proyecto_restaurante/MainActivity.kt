package com.uta.proyecto_restaurante

import android.content.Context
import android.os.Bundle
import androidx.multidex.MultiDex
import io.flutter.embedding.android.FlutterActivity
import android.app.NotificationChannel
import android.app.NotificationManager
import android.os.Build

class MainActivity: FlutterActivity() {
    override fun attachBaseContext(newBase: Context) {
        super.attachBaseContext(newBase)
        MultiDex.install(this)
    }

    override fun onCreate(savedInstanceState: Bundle?) { // Cambia Bundle a Bundle?
        super.onCreate(savedInstanceState)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channelId = getString(R.string.default_notification_channel_id) // Usa el ID definido en strings.xml
            val channelName = "Default Channel" 
            val notificationManager = getSystemService(NotificationManager::class.java)
            notificationManager.createNotificationChannel(NotificationChannel(
                channelId,
                channelName,
                NotificationManager.IMPORTANCE_DEFAULT
            ))
        }
    }
}
