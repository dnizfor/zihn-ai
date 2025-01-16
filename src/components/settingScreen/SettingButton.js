import { TouchableOpacity, Text, StyleSheet } from 'react-native';
import React from 'react';
import colors from '../../utilities/colors';
import { MaterialIcons } from '@expo/vector-icons';

export default function SettingButton({ title }) {
    return (
        <TouchableOpacity style={style.container}>
            <Text style={style.title}>{title}</Text>
            <MaterialIcons name="arrow-forward-ios" size={30} color="white" />
        </TouchableOpacity>
    );
}

const style = StyleSheet.create({
    container: {
        height: 100,
        backgroundColor: colors.gray,
        borderRadius: 20,
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'space-between',
        paddingHorizontal: 20,
        marginBottom: 10

    },
    title: {
        color: colors.white,
        fontSize: 15,
        fontWeight: "bold"
    },
});