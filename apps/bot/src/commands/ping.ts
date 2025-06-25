import { SlashCommandBuilder } from "discord.js";
import { ICommand } from "./command.js";

export const pingCommand = {
    command: new SlashCommandBuilder()
        .setName("ping")
        .setDescription("Replies with Pong!"),
    async execute(interaction) {
        await interaction.reply("Pong!")
    }
} satisfies ICommand;
