import React from 'react'
import * as NavigationBar from 'expo-navigation-bar';
import SettingStack from './SettingStack';
import { useNavigationState } from '@react-navigation/native';
import FeedScreen from '../screens/FeedScreen';
import ChatScreen from '../screens/ChatScreen';
import colors from '../utilities/colors';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { Ionicons } from '@expo/vector-icons';

export default function TabNavigation() {

    NavigationBar.setVisibilityAsync("hidden");
    NavigationBar.setBackgroundColorAsync(colors.black)

    const navigationState = useNavigationState((state) => state);
    const getNestedRouteName = (state) => {
        if (!state) return null;
        const route = state.routes[state.index];
        if (route.state) {
            return getNestedRouteName(route.state);
        }
        return route.name;
    };
    const currentRouteName = getNestedRouteName(navigationState);

    const screenOptions = ({ route }) => ({
        tabBarIcon: ({ focused, color, size }) => {
            let iconName;

            if (route.name === "Feed") {
                iconName = focused ? "bookmark" : "bookmark-outline";
                return (
                    <Ionicons name={iconName} size={size} color={color} />
                );
            } else if (route.name === "Chat") {
                iconName = focused ? "bonfire" : "bonfire-outline";
                return <Ionicons name={iconName} size={size} color={color} />;
            } else if (route.name === "SettingStack") {
                iconName = focused ? "settings-sharp" : "settings-outline";
                return <Ionicons name={iconName} size={size} color={color} />;
            }

        },
        tabBarActiveTintColor: colors.primary,
        tabBarInactiveTintColor: colors.white,
        tabBarHideOnKeyboard: false,
        headerShown: false,
        tabBarStyle: { backgroundColor: colors.black, display: (currentRouteName) === 'Notifications' ? 'none' : 'flex', },
        tabBarLabel: '',


    });

    const Tab = createBottomTabNavigator();
    return (
        <Tab.Navigator screenOptions={screenOptions} >
            <Tab.Screen name="Feed" component={FeedScreen} />
            <Tab.Screen name="Chat" component={ChatScreen} />
            <Tab.Screen name="SettingStack" component={SettingStack} />
        </Tab.Navigator>
    )
}