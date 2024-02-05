package com.pobortsevv.misis.core.entity

import kotlinx.serialization.SerialInfo
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

// TODO: Понять как работать с массивом order

@Serializable
data class Filials(
    @SerialName("order") val order: List<Int>,
    val filials: Map<String, Filial>
)

@Serializable
data class Filial(
    @SerialName("id") val id: Int,
    @SerialName("name") val name: String,
    @SerialName("shortname") val shortname: String,
    @SerialName("code") val code: String
) {
    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other == null || this::class != other::class) return false

        other as Filial

        return id == other.id
    }

    override fun hashCode(): Int {
        return id
    }
}
