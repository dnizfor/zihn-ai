import { Platform } from "react-native";
import * as Linking from 'expo-linking';


const rateApp = () => {
    if (Platform.OS === 'ios') {
        const itunesItemId = 982107779;
        // Open the iOS App Store in the browser -> redirects to App Store on iOS
        Linking.openURL(`https://apps.apple.com/app/apple-store/id${itunesItemId}?action=write-review`);
        // Open the iOS App Store directly
        Linking.openURL(
            `itms-apps://itunes.apple.com/app/viewContentsUserReviews/id${itunesItemId}?action=write-review`
        );


    } else if (Platform.OS === "android") {
        const androidPackageName = 'host.exp.exponent';
        // Open the Android Play Store in the browser -> redirects to Play Store on Android
        Linking.openURL(
            `https://play.google.com/store/apps/details?id=${androidPackageName}&showAllReviews=true`
        );
        // Open the Android Play Store directly
        Linking.openURL(`market://details?id=${androidPackageName}&showAllReviews=true`);

    }
}

export default rateApp