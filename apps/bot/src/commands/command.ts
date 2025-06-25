import { ChatInputCommandInteraction, SlashCommandBuilder } from "discord.js";

export interface ICommand {
    command: SlashCommandBuilder,
    execute:(interaction: ChatInputCommandInteraction) => Promise<void>,
}
