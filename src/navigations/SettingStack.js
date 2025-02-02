
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import NotificationScreen from '../screens/settings/NotificationScreen';
import SettingScreen from '../screens/settings/SettingScreen';
import colors from '../utilities/colors';

const Stack = createNativeStackNavigator();
export default function SettingStack() {
    return (
        <Stack.Navigator screenOptions={{
            headerShown: false,
            tabBarStyle: { backgroundColor: colors.black },
            tabBarLabel: '',
        }}>
            <Stack.Screen name="Settings" component={SettingScreen} />
            <Stack.Screen name="Notifications" component={NotificationScreen} />
        </Stack.Navigator>
    );
}