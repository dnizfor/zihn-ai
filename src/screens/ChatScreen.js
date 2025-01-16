import { FlatList, View, KeyboardAvoidingView, Text, StyleSheet, TextInput, Platform } from 'react-native';
import React from 'react';
import { SafeAreaView } from 'react-native-safe-area-context';
import SendButton from '../components/chatScreen/SendButton';
import colors from '../utilities/colors';

export default function ChatScreen() {
    const [text, onChangeText] = React.useState('')

    const messages = [
        { id: 1, text: 'Hello! How are you?', isSender: true },
        { id: 2, text: "I'm good, thanks! You?", isSender: false },
        { id: 3, text: 'Doing well, thank you!', isSender: true },

        // Daha fazla mesaj eklenebilir...
    ];

    const renderItem = ({ item }) => (
        <View
            style={[
                styles.messageContainer,
                item.isSender ? styles.rightAligned : styles.leftAligned,
            ]}
        >
            <Text
                style={[
                    styles.message,
                    item.isSender ? styles.rightMessage : styles.leftMessage,
                ]}
            >
                {item.text}
            </Text>
        </View>
    );

    return (
        <SafeAreaView style={styles.container} edges={['right', 'top', 'left']}>
            <FlatList
                data={messages}
                renderItem={renderItem}
                keyExtractor={(item) => item.id.toString()}
            />
            <KeyboardAvoidingView KeyboardAvoidingView behavior={Platform.OS === 'ios' ? 'padding' : undefined} style={styles.console}>
                <View style={{ flex: 1 }}>
                    <TextInput
                        style={styles.textInput}
                        onChangeText={onChangeText}
                        value={text}
                        placeholder="Lets Ask to Sleep Consultant!"
                        placeholderTextColor={'white'}
                    />
                </View>
                <SendButton />

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
