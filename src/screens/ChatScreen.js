import { FlatList, View, KeyboardAvoidingView, Text, StyleSheet, TextInput, Platform } from 'react-native';
import React, { useEffect, useRef, useState } from 'react';
import { SafeAreaView } from 'react-native-safe-area-context';
import SendButton from '../components/chatScreen/SendButton';
import colors from '../utilities/colors';
import { usePollinationsChat } from '@pollinations/react';
export default function ChatScreen() {
    const [text, setText] = useState('')
    const flatListRef = useRef(null);

    useEffect(() => {
        flatListRef.current.scrollToEnd({ animated: true, offset: 0 })

    }, [messages])

    const { sendUserMessage, messages } = usePollinationsChat([
        {
            role: "system", content: `You are Dr. Daniel, a warm and approachable therapist known for your creative use of existential therapy. You help the user explore their thoughts and emotions by asking insightful questions, diving straight into deep conversations. You keep the conversation lively and fluid at all times. You show genuine interest in the user's experiences, always demonstrating respect and understanding. You encourage self-reflection by asking thoughtful questions and gently offering suggestions. When you notice patterns in the user's thoughts, emotions, or actions, you point them out. When doing so, you remain open about it and ask the user if they feel you're on the right track. Stay friendly and chatty – avoid making lists. Never be the one to end the conversation. End each message with a question that encourages the user to delve deeper into the topics they are discussing. Answer in the language the user used when asking the question.`
        }
    ], {
        seed: 42,
        jsonMode: false,
        model: 'openai'
    });

    const sendMessage = () => {
        setText('')
        sendUserMessage(text)
        flatListRef.current.scrollToEnd({ animated: true, offset: 0 })

    }



    const renderItem = ({ item }) => (item.role != 'system' &&
        <View
            style={[
                styles.messageContainer,
                item.role === 'user' ? styles.rightAligned : styles.leftAligned,
            ]}
        >
            <Text
                style={[
                    styles.message,
                    item.role === 'user' ? styles.rightMessage : styles.leftMessage,
                ]}
            >
                {item.content}
            </Text>
        </View>
    );

    return (
        <SafeAreaView style={styles.container} edges={['right', 'top', 'left']}>
            <FlatList
                data={messages}
                renderItem={renderItem}
                keyExtractor={(item, index) => index}
                ref={flatListRef}
            />

            <KeyboardAvoidingView KeyboardAvoidingView behavior={Platform.OS === 'ios' ? 'padding' : undefined} style={styles.console}>
                <View style={{ flex: 1 }}>
                    <TextInput
                        style={styles.textInput}
                        onChangeText={t => setText(t)}
                        value={text}
                        placeholder="Lets Ask to Sleep Consultant!"
                        placeholderTextColor={'white'}
                    />
                </View>
                <SendButton onPress={sendMessage} />

            </KeyboardAvoidingView>
        </SafeAreaView>
    );
}

const styles = StyleSheet.create({
    container: {
        paddingTop: 10,
        paddingHorizontal: 20,
        backgroundColor: colors.black,
        flex: 1,

    },

    messageContainer: {
        marginBottom: 10,
    },
    rightAligned: {
        alignItems: 'flex-end',
    },
    leftAligned: {
        alignItems: 'flex-start',
    },
    message: {
        padding: 10,
        borderRadius: 5,
        maxWidth: '80%',
        fontSize: 16,
    },
    rightMessage: {
        backgroundColor: colors.gray,
        color: 'white',
    },
    leftMessage: {
        backgroundColor: colors.gray,
        color: 'white',
    },
    console: {
        flexDirection: 'row',
        marginBottom: 10,
        paddingHorizontal: 10,
        justifyContent: 'flex-end',  // Input alanını ve butonu alt kısma yerleştir
    },
    textInput: {
        height: 50,
        backgroundColor: colors.gray,
        borderRadius: 25,
        paddingHorizontal: 20,
        color: 'white',
    },
});
