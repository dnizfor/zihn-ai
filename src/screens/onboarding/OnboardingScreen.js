import React, { useState } from "react";
import Onboarding from "react-native-onboarding-swiper";
import { View, Text } from "react-native";
import ArrowButton from "../../components/onboarding/ArrowButton";
import LottieView from 'lottie-react-native';
import DoctorAnimation from '../../assets/lotties/doctor.json'
import TherapyAnimation from '../../assets/lotties/therapy.json'
import AfirmationAnimation from '../../assets/lotties/afirmation.json'
import colors from '../../utilities/colors'
import NameOnboarding from "./NameOnboarding";
import NotificationsOnboarding from "./NotificationsOnboarding";
import ReminderOnboarding from "./ReminderOnboarding";
import { createReminder } from "../../utilities/reminder";


export default function OnboardingScreen({ onDone }) {
    const [step, setStep] = useState(0)
    const [userData, setUserData] = useState({
        name: '',
        notification: false,
        reminder: true,
        reminderHours: 0,
        reminderMinutes: 0,

    })
    onboardingHandler = () => {
        if (userData.reminder) {
            createReminder(userData.reminderHours,userData.reminderMinutes)
        }
        if (userData.notification) {
        
            console.log('notifeee');
            
        }
        onDone()

    }
    const onNext = () => setStep(prev => prev + 1)
    const onBack = () => setStep(prev => prev - 1)

    if (step === 0) {
        return (
            <Onboarding
                NextButtonComponent={({ ...props }) => <View style={{ marginBottom: 50, marginRight: 20 }}><ArrowButton {...props} /></View>}

                showSkip={false}
                DoneButtonComponent={({ ...props }) => <View style={{ marginBottom: 50, marginRight: 20 }}><ArrowButton {...props} /></View>}
                titleStyles={{ color: colors.white }}
                bottomBarColor={colors.black}
                imageContainerStyles={{ width: 300, height: 300 }}
                pages={[
                    {
                        backgroundColor: colors.black,
                        image: <LottieView source={TherapyAnimation} autoPlay style={{ width: 300, height: 300 }} />,
                        title: "Welcome to AI Therapy!",
                        subtitle: "Your personal AI-powered well-being companion.",
                    },
                    {
                        backgroundColor: colors.black,
                        image: <LottieView source={DoctorAnimation} autoPlay style={{ width: 300, height: 300 }} />,
                        title: "Designed by Doctors",
                        subtitle: "Our program is created and reviewed by medical professionals for your well-being.",
                    },
                    {
                        backgroundColor: colors.black,
                        image: <LottieView source={AfirmationAnimation} autoPlay style={{ width: 300, height: 300 }} />,
                        title: "Daily Affirmations",
                        subtitle: "Receive positive affirmations tailored to your emotions.",
                    },

                ]}
                onDone={onNext}
            />
        );
    } else if (step === 1) {
        return (<NameOnboarding onNext={onNext} onBack={onBack} setUserData={setUserData} />)
    } else if (step === 2) {
        return <ReminderOnboarding onNext={onNext} onBack={onBack} setUserData={setUserData} />
    } else if (step === 3) {
        return (<NotificationsOnboarding onNext={onboardingHandler} onBack={onBack} setUserData={setUserData} />)
    }


}