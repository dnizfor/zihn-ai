import { View, Text, StyleSheet } from 'react-native';
import React, { useState } from 'react';
import { SafeAreaView } from 'react-native-safe-area-context';
import colors from '../../utilities/colors';
import SwichableButton from '../../components/settingScreen/SwichableButton';
import ArrowButton from '../../components/onboarding/ArrowButton';
import BackButton from '../../components/onboarding/BackButton';

export default function NotificationsOnboarding({ onNext, onBack, setUserData }) {
    const [NotificationIsEnabled, setNotificationIsEnabled] = useState(true)
    const onPress = () => {
        setUserData(prev => ({ ...prev, notification: NotificationIsEnabled }));
        onNext()
    }

    return (
        <SafeAreaView style={styles.container}>
            <View>
                <BackButton onPress={onBack} />
            </View>
            <View style={styles.content}>
                <Text style={styles.title} >Affirmation Notification</Text>
                <Text style={styles.subtitle}>
                    Enable notifications for regular motivational notifications.
                </Text>
                <SwichableButton isEnabled={NotificationIsEnabled} setIsEnabled={setNotificationIsEnabled} title={'Enable Notifications'} />

            </View>
            <View style={styles.console}>
                <ArrowButton onPress={onPress} />
            </View>
        </SafeAreaView>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: colors.black,
        paddingTop: 20,
        paddingHorizontal: 20,
    },
    content: {
        flex: 1,
    },
    title: {
        color: colors.white,
        fontWeight: 'bold',
        marginBottom: 10,
        fontSize: 24,
    },
    subtitle: {
        color: 'gray',
        marginBottom: 20,
        fontSize: 16,
        lineHeight: 24,
    },
    console: {
        alignItems: 'flex-end',
        marginBottom: 30,
    },
});