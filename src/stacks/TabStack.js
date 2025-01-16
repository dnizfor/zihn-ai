import { Ionicons } from '@expo/vector-icons';
import MusicScreen from '../screens/musicScreen/MusicScreen';
import ChatScreen from '../screens/ChatScreen';
import SettingScreen from '../screens/SettingScreen';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import colors from '../utilities/colors';

export default function TabStack() {
    const screenOptions = ({ route }) => ({
        tabBarIcon: ({ focused, color, size }) => {
            let iconName;

            if (route.name === "MusicHouse") {
                iconName = focused ? "musical-notes" : "musical-notes-outline";
                return (
                    <Ionicons name={iconName} size={size} color={color} />
                );
            } else if (route.name === "Chat") {
                iconName = focused ? "bonfire" : "bonfire-outline";
                return <Ionicons name={iconName} size={size} color={color} />;
            } else if (route.name === "Settings") {
                iconName = focused ? "settings-sharp" : "settings-outline";
                return <Ionicons name={iconName} size={size} color={color} />;
            }

        },
        tabBarActiveTintColor: colors.primary,
        tabBarInactiveTintColor: colors.white,
        tabBarHideOnKeyboard: false,
        headerShown: false,
        tabBarStyle: { backgroundColor: colors.black },
        tabBarLabel: '',

    });

    const Tab = createBottomTabNavigator();

    return (
        <Tab.Navigator screenOptions={screenOptions}>
            <Tab.Screen name="MusicHouse" component={MusicScreen} />
            <Tab.Screen name="Chat" component={ChatScreen} />
            <Tab.Screen name="Settings" component={SettingScreen} />
        </Tab.Navigator>
    )
}