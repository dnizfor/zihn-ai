import { View, Text, StyleSheet } from 'react-native'
import React, { useState } from 'react'
import colors from '../../utilities/colors';
import { SafeAreaView } from 'react-native-safe-area-context';
import SwichableButton from '../../components/settingScreen/SwichableButton';
import TimePicker from '../../components/settingScreen/TimePicker';
import ArrowButton from '../../components/onboarding/ArrowButton';
import BackButton from '../../components/onboarding/BackButton';

export default function ReminderOnboarding({ onNext, onBack, setUserData }) {
    const [ReminderIsEnabled, setReminderIsEnabled] = useState(true)
    const onPress = () => {
        setUserData(prev => ({ ...prev, reminder: ReminderIsEnabled }));
        onNext()
    }
    const timeHandler = (time) => {
        setUserData(prev => ({
            ...prev,
            reminderHours: time.hours,
            reminderMinutes: time.minutes
        }));

    }
    return (
        <SafeAreaView style={styles.container} >
            <View>
                <BackButton onPress={onBack} />
            </View>
            <View style={styles.content}>
                <Text style={styles.title}>Set Therapy Reminder</Text>
                <Text style={styles.subtitle}>
                    In order not to disrupt the daily therapy process, we will send you a reminder half an hour before the time you set.
                </Text>
                <SwichableButton isEnabled={ReminderIsEnabled} setIsEnabled={setReminderIsEnabled} title={'Enable Therapy Reminder'} />

                {ReminderIsEnabled && <>
                    <Text style={styles.subtitle}>
                        Schedule a meeting with your therapist
                    </Text>
                    <TimePicker timeHandler={timeHandler} /></>}
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