import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import ChatScreen from './src/screens/ChatScreen';
import { NavigationContainer } from '@react-navigation/native';
import { Ionicons } from "@expo/vector-icons";
import colors from './src/utilities/colors';
import SettingScreen from './src/screens/SettingScreen';
import { StatusBar } from 'expo-status-bar';
import { SafeAreaProvider } from 'react-native-safe-area-context';
import MusicStack from './src/stacks/MusicStack';
export default function App() {
  const Tab = createBottomTabNavigator();
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
  return (
    <SafeAreaProvider>

      <NavigationContainer>
        <Tab.Navigator screenOptions={screenOptions}>
          <Tab.Screen name="MusicHouse" component={MusicStack} />
          <Tab.Screen name="Chat" component={ChatScreen} />
          <Tab.Screen name="Settings" component={SettingScreen} />
        </Tab.Navigator>
        <StatusBar hidden style='dark' />
      </NavigationContainer >

    </SafeAreaProvider>
  );
}

