package com.example.misis

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform