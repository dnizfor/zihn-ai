import * as Notifications from 'expo-notifications';
import AsyncStorage from '@react-native-async-storage/async-storage';

export const createReminder = async (hour,minute) => {
    const reminder_id = await Notifications.scheduleNotificationAsync({
        content: {
            title: 'Therapy Time is Approaching! 🕒',
            body: "Hello! Are you ready for today's therapy session? Taking time for yourself will help you feel better. We're looking forward to seeing you! 💙",
        },
        trigger: {
            type: Notifications.SchedulableTriggerInputTypes.DAILY,
            hour: hour,
            minute: minute,
            repeats:true

        },
    });
    await AsyncStorage.setItem('reminder_id', reminder_id);
    console.log(reminder_id,hour,minute);
    

}

export const deleteReminder = async ()=> {
    const reminder_id = await AsyncStorage.getItem('reminder_id');
    await Notifications.cancelScheduledNotificationAsync(reminder_id)
}