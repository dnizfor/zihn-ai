
import { NavigationContainer } from '@react-navigation/native';
import { StatusBar } from 'expo-status-bar';
import { SafeAreaProvider } from 'react-native-safe-area-context';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { Ionicons } from '@expo/vector-icons';
import ChatScreen from './src/screens/ChatScreen';
import SettingScreen from './src/screens/SettingScreen';
import colors from './src/utilities/colors';
import FeedScreen from './src/screens/FeedScreen';

export default function App() {

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
    <SafeAreaProvider>

      <NavigationContainer>
        <Tab.Navigator screenOptions={screenOptions}>
          <Tab.Screen name="Feed" component={FeedScreen} />
          <Tab.Screen name="Chat" component={ChatScreen} />
          <Tab.Screen name="Settings" component={SettingScreen} />
        </Tab.Navigator>
        <StatusBar hidden style='dark' />
      </NavigationContainer >

    </SafeAreaProvider>
  );
}

