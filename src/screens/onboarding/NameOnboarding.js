import { View, Text, StyleSheet, TextInput } from 'react-native'
import React, { useState } from 'react'
import { SafeAreaView } from 'react-native-safe-area-context'
import colors from '../../utilities/colors'
import ArrowButton from '../../components/onboarding/ArrowButton'
import BackButton from '../../components/onboarding/BackButton'

export default function NameOnboarding({ onNext, onBack, setUserData }) {

    const [text, onChangeText] = useState('');
    const onPress = () => {
        setUserData(prev => prev.name = text)
        onNext()
    }

    return (
        <SafeAreaView style={style.container}>
            <View>
                <BackButton onPress={onBack} />
            </View>
            <View style={style.content}>
                <Text style={style.title}>What is your name? </Text>
                <Text style={style.subtitle}>Please enter your name so that we can address you properly.</Text>
                <TextInput
                    style={style.input}
                    onChangeText={onChangeText}
                    placeholder={'Name'}
                    placeholderTextColor={'gray'}
                    value={text} />
            </View>
            <View style={style.console}>
                {text.trim() !== '' && <ArrowButton onPress={onPress} />}

            </View>

        </SafeAreaView>
    )
}
const style = StyleSheet.create({
    container: {
        backgroundColor: colors.black,
        flex: 1,
        paddingTop: 10,
        paddingHorizontal: 20,
    }, content: {
        flex: 1,
    },
    title: {
        color: colors.white,
        fontSize: 30,
        fontWeight: 'bold'
    }, subtitle: {
        fontSize: 15,
        color: colors.white,
        fontWeight: 'bold',
        marginTop: 10
    }, input: {
        backgroundColor: colors.white,
        height: 50,
        width: '100%',
        marginTop: 10,
        borderRadius: 10,
        paddingHorizontal: 10,
        fontWeight: 'bold'


    }, console: {
        alignItems: 'flex-end',
        marginBottom: 20
    }
})