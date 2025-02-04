
import { NavigationContainer } from '@react-navigation/native';
import { StatusBar } from 'expo-status-bar';
import { SafeAreaProvider } from 'react-native-safe-area-context';
import * as TaskManager from 'expo-task-manager';

import AsyncStorage from "@react-native-async-storage/async-storage";
import { useState, useEffect } from 'react';
import OnboardingScreen from './src/screens/onboarding/OnboardingScreen';
import TabNavigation from './src/navigations/TabNavigation';
import * as Notifications from 'expo-notifications';

Notifications.setNotificationHandler({
  handleNotification: async () => ({
    shouldShowAlert: true,
    shouldPlaySound: false,
    shouldSetBadge: false,
  }),
});


export default function App() {

  const [isFirst, setIsFirst] = useState(false);

  // useEffect(() => {
  //   AsyncStorage.getItem("isFirst").then((res) =>
  //     res ? setIsFirst(false) : setIsFirst(true)
  //   ).catch(error => console.log(error))

  // }, []);




  const onboardingOnPass = () => {
    setIsFirst((prev) => !prev);
    AsyncStorage.setItem("isFirst", "it is not first").catch(err => console.log(err))
  };

  if (!isFirst) return <OnboardingScreen onDone={onboardingOnPass} />

  return (
    <SafeAreaProvider>
      <NavigationContainer>
        <TabNavigation />
        <StatusBar hidden style='dark' />

      </NavigationContainer >

    </SafeAreaProvider>
  );
}

