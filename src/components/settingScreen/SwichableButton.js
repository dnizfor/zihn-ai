import {
    View, Text, StyleSheet, Switch, TouchableOpacity,
} from 'react-native'
import React, { useState } from 'react'
import colors from '../../utilities/colors';
export default function SwichableButton({ onPress, title, isEnabled, setIsEnabled }) {
    const toggleSwitch = () => setIsEnabled(previousState => !previousState);


    return (
        <TouchableOpacity onPress={onPress} style={styles.container}>
            <View style={styles.content}>
                <View style={styles.textContainer}>
                    <Text style={styles.title} >
                        {title}
                    </Text>
                </View>
                <View style={styles.switchContainer} >
                    <Switch
                        trackColor={{ false: '#767577', true: '#81b0ff' }}
                        thumbColor={isEnabled ? "#2979FF" : '#f4f3f4'}
                        ios_backgroundColor="#3e3e3e"
                        onValueChange={toggleSwitch}
                        style={{ transform: [{ scaleX: 1.2 }, { scaleY: 1.2 }] }}
                        value={isEnabled}
                    />
                </View>
            </View>


        </TouchableOpacity>
    )
} const styles = StyleSheet.create({
    container: {
        backgroundColor: colors.white,
        height: 100,
        borderRadius: 20,
        backgroundColor: colors.gray,
        width: '100%',
        marginBottom: 10,


    }, content: {
        flex: 1,
        flexDirection: 'row',
        justifyContent: "space-between",
        paddingHorizontal: 20,


    },
    textContainer: {
        justifyContent: "center",

    },
    title: {
        fontWeight: 'bold',
        fontSize: 15,
        color: colors.white,
        backgroundColor: 'transparent',
    }, switchContainer: { justifyContent: 'center' }
    , trashButton: {
        backgroundColor: colors.alert,
        justifyContent: "center",
        alignItems: "center",
        width: 75,
        borderRadius: 20,
        height: 100,
    }
});