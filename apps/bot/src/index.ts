import { config } from "./config.js";
import { clientBuilder, VibeBotClient } from "./client.js";
import { Guild } from "discord.js";

const client = clientBuilder();

// Event triggered when we are logged in
client.on('ready', () => {
    console.log(`Logged in as ${client.user?.tag}!`);
    client.user?.setStatus('online');
    client.user?.setActivity({
        name: "with their vibe",
    })
});

// Event triggered for many things, including slash commands
client.on('interactionCreate', async (interaction) => {
    if (!interaction.isChatInputCommand()) return;

    const command = (interaction.client as VibeBotClient).commands.get(interaction.commandName);

    if (!command) {
        console.error(`No command matching ${interaction.commandName} was found.`);
        return;
    }

    try {
        await command.execute(interaction);
    } catch (error) {
        console.error(error);
        if (interaction.replied || interaction.deferred) {
            await interaction.followUp({
                content: 'There was an error while executing this command!',
                ephemeral: true,
            });
        } else {
            await interaction.reply({
                content: 'There was an error while executing this command!',
                ephemeral: true,
            });
        }
    }
});

// Event triggered when a guild becomes available to us (AKA we are in the server)
client.on('guildAvailable', async (event: Guild) => {
    console.log(event);
})

// Replace 'YOUR_BOT_TOKEN' with your actual bot token
// It's highly recommended to use environment variables for your token
// process.env.DISCORD_TOKEN
client.login(config.token);
