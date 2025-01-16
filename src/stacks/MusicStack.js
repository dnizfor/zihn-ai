import { View, Text } from 'react-native'
import React from 'react'
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import MusicScreen from '../screens/musicScreen/MusicScreen';
import MusicPlayerScreen from '../screens/musicScreen/MusicPlayerScreen';
import colors from '../utilities/colors';
const Stack = createNativeStackNavigator();

export default function MusicStack() {


    return (
        <Stack.Navigator screenOptions={{ headerShown: false }} >
            <Stack.Screen name="MusicHome" component={MusicScreen} />
            <Stack.Screen name="MusicPlayer" component={MusicPlayerScreen} />

        </Stack.Navigator>
    )
}