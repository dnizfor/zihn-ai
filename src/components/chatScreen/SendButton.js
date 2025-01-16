import { TouchableOpacity, StyleSheet } from "react-native";
import React from "react";
import { AntDesign } from "@expo/vector-icons";
import colors from "../../utilities/colors";

export default function SendButton({ onPress }) {
    return (
        <TouchableOpacity style={PlusButtonStyle.container} onPress={onPress}>
            <AntDesign name={"arrowright"} size={25} color={"black"} />
        </TouchableOpacity>
    );
}

const PlusButtonStyle = StyleSheet.create({
    container: {
        width: 50,
        height: 50,
        backgroundColor: colors.white,
        borderRadius: 25,
        justifyContent: "center",
        alignItems: "center",
        marginLeft: 10

    },
});