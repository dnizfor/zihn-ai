import { View, Text } from 'react-native'
import React, { useState } from 'react'
import { TimerPicker } from "react-native-timer-picker";
import { LinearGradient } from "expo-linear-gradient";
import colors from '../../utilities/colors';


export default function TimePicker({ timeHandler }) {

    const [alarmString, setAlarmString] = useState(null);


    return (
        <View style={{ backgroundColor: colors.gray, borderRadius: 15, alignItems: "center", justifyContent: "center", marginTop: 10 }}>
            <TimerPicker
                padWithNItems={1}
                hourLabel=":"
                minuteLabel=""
                initialHours={0}
                initialMinutes={0}
                secondLabel=""
                LinearGradient={LinearGradient}
                onDurationChange={timeHandler}
                hideSeconds
                styles={{
                    theme: "dark",
                    backgroundColor: colors.gray,
                    pickerItem: {
                        fontSize: 34,
                    },
                    pickerLabel: {
                        fontSize: 32,
                        marginTop: 0,
                    },
                    pickerContainer: {
                        marginRight: 6,
                    },
                    pickerItemContainer: {
                        width: 100
                    },
                    pickerLabelContainer: {
                        right: -20,
                        top: 0,
                        bottom: 6,
                        width: 40,
                        alignItems: "center",
                    },
                }}
            />
        </View>
    )
}