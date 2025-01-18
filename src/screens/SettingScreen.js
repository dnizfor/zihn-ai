import { Image, StyleSheet, ScrollView } from 'react-native';
import React from 'react';
import { SafeAreaView } from 'react-native-safe-area-context';
import colors from '../utilities/colors';
import SettingButton from '../components/settingScreen/SettingButton';
import headerImage from '../assets/images/sunset.jpg';
import SwichableButton from '../components/settingScreen/SwichableButton';
export default function SettingScreen() {
    return (
        <SafeAreaView style={styles.container} edges={['right', 'top', 'left']}>

            <ScrollView showsVerticalScrollIndicator={false}>
                <Image
                    style={styles.headerImage}
                    source={headerImage}
                />
                <SettingButton title={"Be Premium"} />
                <SettingButton title={"Set Notification Circle"} />
                <SwichableButton title={"Turn ON Notification"} />
                <SwichableButton title={"Turn ON Quotes Notification"} />
                <SettingButton title={"Contact US"} />

            </ScrollView>
        </SafeAreaView>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: colors.black,
        justifyContent: 'flex-start',
        paddingTop: 10,
        paddingHorizontal: 20,
    }, headerImage: {
        width: '100%',
        borderRadius: 20,
        height: 200,
        marginBottom: 10,
    },

});
