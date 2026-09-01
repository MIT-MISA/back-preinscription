// EmailService.cs
using MailKit.Net.Smtp;
using MimeKit;
using Microsoft.Extensions.Configuration;
public interface IEmailService
{
    Task EnvoyerEmailAsync(string destinataire, string sujet, string corps);
}

public class EmailService : IEmailService
{
    private readonly IConfiguration _config;
    public EmailService(IConfiguration config)
    {
        _config = config;
    }
    public async Task EnvoyerEmailAsync(string destinataire, string sujet, string corps)
    {
        var email = _config["EmailSettings:Email"];
        var password = _config["EmailSettings:Password"];
        var message = new MimeMessage();
        message.From.Add(MailboxAddress.Parse(email));
        message.To.Add(MailboxAddress.Parse(destinataire));
        message.Subject = sujet;
        message.Body = new TextPart("plain") { Text = corps };

        using var client = new SmtpClient();
        await client.ConnectAsync("smtp.gmail.com", 587, MailKit.Security.SecureSocketOptions.StartTls);
        await client.AuthenticateAsync(email, password); // mot de passe d’application Gmail
        await client.SendAsync(message);
        await client.DisconnectAsync(true);
    }
}

