import * as MailComposer from 'expo-mail-composer';


const sendMail = async (subject) => {
    try {
        const isAvailable = await MailComposer.isAvailableAsync();
        if (isAvailable) {
            await MailComposer.composeAsync({
                recipients: ['team@lingovido.com'],
                subject,
            });
        } else {
            console.log('mail error')
        }
    } catch (error) {
        console.log('mail error', error)

    }

};

export default sendMail