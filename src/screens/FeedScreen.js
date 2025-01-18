import { View, FlatList, StyleSheet, Dimensions, Text, Image, ImageBackground } from 'react-native';
import React from 'react';
import { SafeAreaView, useSafeAreaInsets } from 'react-native-safe-area-context';
import colors from '../utilities/colors';

export default function FeedScreen() {
    const insets = useSafeAreaInsets();

    const data = [
        { id: '1', text: 'Hayatta tek gerçek korku, korkaktır.' },
        { id: '2', text: 'Başarı, hazırlıkla fırsatın buluştuğu yerdir.' },
        { id: '3', text: 'Düşlemek, başarıya giden ilk adımdır.' },
        { id: '4', text: 'Zamanı iyi kullan, o seni asla geri bırakmaz.' },

    ];

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
                keyExtractor={item => item.id}
                pagingEnabled
                renderItem={renderItem}
                horizontal={false}
                showsVerticalScrollIndicator={false}
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
        backgroundColor: 'yellow',
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
