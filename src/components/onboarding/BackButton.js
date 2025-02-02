import { TouchableOpacity, StyleSheet } from "react-native";
import React from "react";
import { Ionicons } from "@expo/vector-icons";

export default function BackButton({ ...props }) {
    return (
        <TouchableOpacity style={BackButtonStyle.container}  {...props} >
            <Ionicons name={"arrow-back"} size={30} color={"white"} />
        </TouchableOpacity>
    );
}

const BackButtonStyle = StyleSheet.create({
    container: {
        width: 50,
        height: 50,
    },
});