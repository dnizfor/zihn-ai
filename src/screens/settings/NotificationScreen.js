import { View, Text, StyleSheet } from 'react-native';
import React, { useState } from 'react';
import { SafeAreaView } from 'react-native-safe-area-context';
import colors from '../../utilities/colors';
import SwichableButton from '../../components/settingScreen/SwichableButton';
import TimePicker from '../../components/settingScreen/TimePicker';
import { useNavigation } from '@react-navigation/native';
import BackButton from '../../components/onboarding/BackButton';

export default function NotificationSetting() {
    const [ReminderIsEnabled, setReminderIsEnabled] = useState(true)
    const [NotificationIsEnabled, setNotificationIsEnabled] = useState(true)
    const navigation = useNavigation();

    return (
        <SafeAreaView style={styles.container}>
            <View>
                <BackButton onPress={() => navigation.goBack()} />
            </View>
            <View style={styles.content}>
                <Text style={styles.title} >Affirmation Notification</Text>
                <Text style={styles.subtitle}>
                    Enable notifications for regular motivational notifications.
                </Text>
                <SwichableButton isEnabled={NotificationIsEnabled} setIsEnabled={setNotificationIsEnabled} title={'Enable Notifications'} />

                <Text style={styles.title}>Set Therapy Reminder</Text>
                <Text style={styles.subtitle}>
                    In order not to disrupt the daily therapy process, we will send you a reminder half an hour before the time you set.
                </Text>
                <SwichableButton isEnabled={ReminderIsEnabled} setIsEnabled={setReminderIsEnabled} title={'Enable Therapy Reminder'} />



                {ReminderIsEnabled && <>
                    <Text style={styles.subtitle}>
                        Schedule a meeting with your therapist
                    </Text>
                    <TimePicker /></>}
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

});