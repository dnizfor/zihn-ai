
import { NavigationContainer } from '@react-navigation/native';
import { StatusBar } from 'expo-status-bar';
import { SafeAreaProvider } from 'react-native-safe-area-context';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import TabStack from './src/stacks/TabStack';
import MusicPlayerScreen from './src/screens/musicScreen/MusicPlayerScreen';

export default function App() {
  const Stack = createNativeStackNavigator();

  return (
    <SafeAreaProvider>

      <NavigationContainer>
        <Stack.Navigator screenOptions={{ headerShown: false }} >
          <Stack.Screen name="MusicHome" component={TabStack} />
          <Stack.Screen name="MusicPlayer" component={MusicPlayerScreen} />
        </Stack.Navigator>
        <StatusBar hidden style='dark' />
      </NavigationContainer >

    </SafeAreaProvider>
  );
}

