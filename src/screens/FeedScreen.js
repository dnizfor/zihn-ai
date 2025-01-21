import { View, FlatList, StyleSheet, Dimensions, Text, Image, ImageBackground } from 'react-native';
import React, { useCallback, useEffect, useState } from 'react';
import { SafeAreaView, useSafeAreaInsets } from 'react-native-safe-area-context';
import colors from '../utilities/colors';
import { usePollinationsChat } from '@pollinations/react';
import { getLocales } from 'expo-localization';

export default function FeedScreen() {
    const insets = useSafeAreaInsets();
    const [data, setData] = useState([])
    const { sendUserMessage, messages } = usePollinationsChat([
        {
            role: "system", content: `you are a psychologist`
        }
    ], {
        seed: 42,
        jsonMode: false,
        model: 'openai'
    });

    useEffect(() => {
        sendMessage()
    }, [])
    useEffect(() => {
        const filteredMessages = messages.filter(item => item.role === 'assistant')

        if (filteredMessages.length > 0) {
            const lastAnswer = filteredMessages[filteredMessages.length - 1]['content']

            let affirmations = lastAnswer.split(' /n')
            affirmations = affirmations.map((affirmation, index) => ({
                text: affirmation.trim()  // text olarak cümleyi ekliyoruz
            }));
            setData(prev => [...prev, ...affirmations])
        }



    }, [messages])
    const deviceLanguage = getLocales()[0].languageCode;


    const sendMessage = () => {
        sendUserMessage(`Write 5 affirmations in ${deviceLanguage} for someone who is depressed, separating each one with /n. Write only the sentences, nothing else.`)

    }

    const onViewableItemsChanged = useCallback(({ viewableItems }) => {

        if (viewableItems[0]['index'] % 3 === 0 && viewableItems[0]['index'] > data.length - 4) {
            sendMessage()

        }
    }, []);

    const viewabilityConfig = {
        viewAreaCoveragePercentThreshold: 50, // %50'den fazla görünen öğeler
    };
    const renderItem = ({ item, index }) => (
        <ImageBackground resizeMode='stretch' source={require('../assets/images/cardBg.jpeg')} style={{
            ...styles.card, height: Dimensions.get('window').height - insets.bottom
        }}>
            < Text style={styles.title} > {item.text}</Text>
        </ImageBackground >
    );

    return (
        <SafeAreaView edges={["top", "right", "left"]} style={styles.container}>
            <FlatList
                data={data}
                keyExtractor={(item, index) => index}
                pagingEnabled
                renderItem={renderItem}
                horizontal={false}
                showsVerticalScrollIndicator={false}
                onViewableItemsChanged={onViewableItemsChanged}
                viewabilityConfig={viewabilityConfig}
            />
        </SafeAreaView>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: colors.black,
    },
    card: {
        width: Dimensions.get('window').width,
        justifyContent: 'center',
        alignItems: 'center',
        paddingHorizontal: 20,
        position: 'relative',
    },
    title: {
        fontSize: 24,
        fontWeight: 'bold',
        textAlign: 'center',
        color: 'white',
    },
});
