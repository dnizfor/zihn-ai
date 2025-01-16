import { Text, StyleSheet, ScrollView } from 'react-native';
import React from 'react';
import { SafeAreaView } from 'react-native-safe-area-context';
import colors from '../utilities/colors';
import SettingButton from '../components/settingScreen/SettingButton';

export default function SettingScreen() {
    return (
        <SafeAreaView style={styles.container} edges={['right', 'top', 'left']}>
            <ScrollView >
                <SettingButton title={"Be Premium"} />
                <SettingButton title={"Set Notification Circle"} />
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
    },

});
