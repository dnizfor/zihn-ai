
import { NavigationContainer } from '@react-navigation/native';
import { StatusBar } from 'expo-status-bar';
import { SafeAreaProvider } from 'react-native-safe-area-context';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { Ionicons } from '@expo/vector-icons';
import ChatScreen from './src/screens/ChatScreen';
import SettingScreen from './src/screens/SettingScreen';
import colors from './src/utilities/colors';
import FeedScreen from './src/screens/FeedScreen';
import AsyncStorage from "@react-native-async-storage/async-storage";
import { useState, useEffect } from 'react';
import OnboardingScreen from './src/screens/onboarding/OnboardingScreen';
import * as NavigationBar from 'expo-navigation-bar';

export default function App() {

  const [isFirst, setIsFirst] = useState(false);

  // useEffect(() => {
  //   AsyncStorage.getItem("nativeLanguage").then((res) =>
  //     res ? setNativeIsSelected(true) : setNativeIsSelected(false)
  //   ).catch(error => console.log(error))

  //   AsyncStorage.getItem("isFirst").then((res) =>
  //     res ? setIsFirst(false) : setIsFirst(true)
  //   ).catch(error => console.log(error))

  // }, []);

  NavigationBar.setVisibilityAsync("hidden");
  NavigationBar.setBackgroundColorAsync(colors.black)

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


  const onboardingOnPass = () => {
    setIsFirst((prev) => !prev);
    AsyncStorage.setItem("isFirst", "it is not first").catch(err => console.log(err))
  };

  if (!isFirst) return <OnboardingScreen onDone={onboardingOnPass} />

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

