import { StyleSheet, TouchableOpacity, View } from 'react-native';
import React from 'react';
import { SafeAreaView } from 'react-native-safe-area-context';
import colors from '../../utilities/colors';
import SafeHeader from '../../components/global/SafeHeader';
import { Ionicons } from '@expo/vector-icons';
import Slider from '@react-native-community/slider';

export default function MusicPlayerScreen() {


    return (
        <SafeAreaView style={styles.container} edges={['right', 'top', 'left']}>
            <SafeHeader />
            <View style={styles.mainContent}>
                <TouchableOpacity style={styles.genreCard}>
                    <Ionicons name={'bonfire'} size={150} color={colors.white} />
                </TouchableOpacity>
            </View>

            <View style={styles.console}>
                <Slider
                    style={styles.slider}
                    minimumValue={0}
                    maximumValue={1}
                    minimumTrackTintColor={colors.primary}
                    maximumTrackTintColor={colors.white}
                />

                <View style={styles.consoleBar}>
                    <TouchableOpacity style={styles.controlButton}>
                        <Ionicons name={'play-back'} size={25} color={colors.white} />
                    </TouchableOpacity>

                    <TouchableOpacity style={styles.mainControlButton}>
                        {
                            0 === 0
                                ? <Ionicons name={'play'} size={80} color={colors.white} />
                                : <Ionicons name={'pause'} size={80} color={colors.white} />
                        }
                    </TouchableOpacity>

                    <TouchableOpacity style={styles.controlButton}>
                        <Ionicons name={'play-forward'} size={25} color={colors.white} />
                    </TouchableOpacity>
                </View>
            </View>
        </SafeAreaView>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: colors.black,
    },
    mainContent: {
        justifyContent: 'center',
        alignItems: 'center',
        flex: 1,
    },
    genreCard: {
        backgroundColor: colors.gray,
        width: 250,
        height: 250,
        marginRight: 10,
        borderRadius: 125,
        justifyContent: 'center',
        alignItems: 'center',
    },
    console: {
        height: 250,
        margin: 20,
        justifyContent: 'center',
        alignItems: 'center',
    },
    slider: {
        width: '80%',
        height: 40,
        marginVertical: 20,
    },
    sliderValue: {
        fontSize: 24,
        color: colors.primary,
        marginBottom: 10,
    },
    consoleBar: {
        flexDirection: 'row',
        justifyContent: 'center',
        alignItems: 'center',
        marginTop: 20,
    },
    mainControlButton: {
        marginHorizontal: 15,
        height: 90,
        width: 90,
        justifyContent: 'center',
        alignItems: 'center',
    },
    controlButton: {
        marginHorizontal: 15,
        height: 50,
        width: 50,
        justifyContent: 'center',
        alignItems: 'center',
    },
});
