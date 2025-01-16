import { StyleSheet, Text, Image, View, ScrollView, TouchableOpacity } from 'react-native'
import React from 'react'
import { SafeAreaView } from 'react-native-safe-area-context'
import colors from '../../utilities/colors'
import headerImage from '../../assets/images/app/sunset_modified.jpg'
import { Ionicons } from "@expo/vector-icons";
import {
    useNavigation,
} from '@react-navigation/native';
export default function MusicScreen() {
    const musicData = [
        {
            genres: 'naturel',
            icon: <Ionicons name={'bonfire'} size={50} color={'white'} />,
            src: '',
        }, {
            genres: 'naturel',
            icon: <Ionicons name={'bonfire'} size={50} color={'white'} />,
            src: '',
        },
        {
            genres: 'naturel',
            icon: <Ionicons name={'musical-notes'} size={50} color={'white'} />,
            src: '',
        },
        {
            genres: 'meditation',
            icon: <Ionicons name={'leaf'} size={50} color={'white'} />,
            src: '',
        },
        {
            genres: 'naturel',
            icon: <Ionicons name={'water'} size={50} color={'white'} />,
            src: '',
        },
        {
            genres: 'relaxing',
            icon: <Ionicons name={'cloud'} size={50} color={'white'} />,
            src: '',
        },
    ];
    const navigation = useNavigation();
    // Benzersiz `genres` değerlerini gruplama
    const groupedData = musicData.reduce((acc, item) => {
        if (!acc[item.genres]) {
            acc[item.genres] = [];
        }
        acc[item.genres].push(item);
        return acc;
    }, {});
    return (
        <SafeAreaView style={styles.container} edges={['right', 'top', 'left']}>
            <Image
                style={styles.headerImage}
                source={headerImage}
            />
            <ScrollView showsVerticalScrollIndicator={false}>
                {Object.keys(groupedData).map((genre, index) => (
                    <View key={index} style={styles.genreGroup}>
                        <Text style={styles.genresTitle}>{genre}</Text>
                        <ScrollView horizontal={true} showsHorizontalScrollIndicator={false} style={styles.genresCardList} >

                            {groupedData[genre].map((item, subIndex) => (
                                <TouchableOpacity onPress={() => navigation.navigate('MusicPlayer')} key={subIndex} style={styles.genreCard}>
                                    {item.icon}

                                </TouchableOpacity >
                            ))}
                        </ScrollView>

                    </View>
                ))}
            </ScrollView>

        </SafeAreaView>
    )
}
const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: colors.black,
        paddingHorizontal: 20,
    },
    headerImage: {
        width: '100%',
        borderRadius: 20,
        height: 200,
    },
    genreGroup: {},
    genresTitle: {
        color: colors.white,
        fontSize: 20,
        fontWeight: 'bold',
        marginVertical: 10
    }, genresCardList: {
        flexDirection: 'row',
    }
    ,
    genreCard: {
        backgroundColor: colors.gray,
        width: 100,
        height: 100,
        marginRight: 10,
        borderRadius: 10,
        justifyContent: 'center',
        alignItems: 'center',
    }
})