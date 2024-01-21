package com.pobortsevv.misis

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform