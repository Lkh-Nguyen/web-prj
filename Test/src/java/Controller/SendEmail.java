/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author DUYAN
 */
public class SendEmail {

    public void sendMail(String mail, String name) {

        final String username = "duyan9646@gmail.com";
        final String password = "iffq wscv ghyb efun";
        String fromEmail = "duyan9646@gmail.com";
        String toEmail = mail;
        Properties properties = new Properties();

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        MimeMessage mgs = new MimeMessage(session);
        try {

            mgs.setFrom(new InternetAddress(fromEmail));
            mgs.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            mgs.setSubject("Welcome to FiveStars Cinema: Your Ticket to Entertainment Excellence!");
            mgs.setText("FiveStars Cinema Team"
                    +"\n"
                    +"Dear "+ name+",\n"
                    + "\n"
                    + "Welcome to FiveStars Cinema! We are thrilled to have you on board and thank you for registering with us. Your journey to exceptional cinematic experiences begins now!\n"
                    + "\n"
                    + "At FiveStars Cinema, we strive to redefine the movie-going experience by offering top-notch amenities, unparalleled customer service, and a diverse selection of films to cater to all tastes. Whether you're a fan of action-packed blockbusters, heartwarming dramas, or captivating documentaries, we have something for everyone.\n"
                    + "\n"
                    + "Here are a few highlights of what you can expect as a member of FiveStars Cinema:\n"
                    + "\n"
                    + "State-of-the-Art Facilities: Our theaters are equipped with cutting-edge technology to ensure the highest quality audio and visual experience. Sit back, relax, and immerse yourself in the magic of the big screen.\n"
                    + "\n"
                    + "Exclusive Events and Screenings: As a valued member, you'll have access to exclusive events, premieres, and special screenings. Be the first to witness the latest releases and participate in exciting promotions.\n"
                    + "\n"
                    + "Comfort and Convenience: Say goodbye to long queues and crowded lobbies. With our user-friendly online booking system, you can easily reserve your seats in advance and skip the hassle. Plus, enjoy amenities like comfortable seating and gourmet concessions for the ultimate movie-going experience.\n"
                    + "\n"
                    + "Personalized Recommendations: Let us take the guesswork out of movie selection. Our recommendation engine analyzes your viewing preferences to suggest films tailored to your tastes. Discover new favorites and explore hidden gems with ease.\n"
                    + "\n"
                    + "Rewards and Loyalty Program: Earn points with every purchase and unlock exciting rewards. Whether it's free tickets, concession discounts, or exclusive merchandise, your loyalty pays off with FiveStars Cinema.\n"
                    + "\n"
                    + "We are committed to providing you with unforgettable moments and unforgettable movies. So sit back, relax, and get ready to embark on an extraordinary cinematic journey with FiveStars Cinema.\n"
                    + "\n"
                    + "Once again, welcome to the FiveStars family! If you have any questions or need assistance, feel free to reach out to our dedicated customer support team at [email protected]\n"
                    + "\n"
                    + "Lights, camera, action!\n"
                    + "\n"
                    + "Warm regards,\n"
                    + "\n"
                    + "From An,\n"
                    +"FiveStars Cinema Team");
            Transport.send(mgs);
            System.out.println("Sent Magess");
        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }
    
    
        public void sendCheckPass(String mail, int token) {

        final String username = "duyan9646@gmail.com";
        final String password = "iffq wscv ghyb efun";
        String fromEmail = "duyan9646@gmail.com";
        String toEmail = mail;
        Properties properties = new Properties();

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        MimeMessage mgs = new MimeMessage(session);
        try {

            mgs.setFrom(new InternetAddress(fromEmail));
            mgs.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            mgs.setSubject("Request to change password !!!");
            mgs.setText("Your password change verification code is: " + token);
            Transport.send(mgs);
            System.out.println("Sent Magess");
        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }
}