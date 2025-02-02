import { Image, StyleSheet, ScrollView, Alert } from 'react-native';
import React from 'react';
import { SafeAreaView } from 'react-native-safe-area-context';
import colors from '../../utilities/colors';
import SettingButton from '../../components/settingScreen/SettingButton';
import headerImage from '../../assets/images/sunset.jpg';
import sendMail from '../../utilities/sendMail';
import rateApp from '../../utilities/rateApp';
import {
    useNavigation,
} from '@react-navigation/native';
export default function SettingScreen() {
    const navigation = useNavigation();
    return (
        <SafeAreaView style={styles.container} edges={['right', 'top', 'left']}>

            <ScrollView showsVerticalScrollIndicator={false}>
                <Image
                    style={styles.headerImage}
                    source={headerImage}
                />
                <SettingButton title={"Be Premium"} />
                <SettingButton title={"Notifications"} onPress={() => navigation.navigate('Notifications')} />
                <SettingButton title={"Rate Us!"} onPress={rateApp} />
                <SettingButton onPress={() => sendMail('Feedback & Contact Zihn Ai')} title={"Feedback & Contact"} />

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
