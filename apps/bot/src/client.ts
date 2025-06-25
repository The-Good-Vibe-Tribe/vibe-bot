import { Client, ClientOptions, Collection, GatewayIntentBits, SlashCommandBuilder } from "discord.js";
import { ICommand } from "./commands/command.js";
import { pingCommand } from "./commands/ping.js";

export class VibeBotClient extends Client {
    public commands: Collection<string, ICommand>;

    constructor(options: ClientOptions) {
        super(options);

        this.commands = new Collection();
    }

    addCommand(command: ICommand) {
        this.commands.set(command.command.name, command);
    }
}

export function clientBuilder() {
    const client = new VibeBotClient({
        intents: [
            GatewayIntentBits.Guilds,
            GatewayIntentBits.GuildMessages,
            GatewayIntentBits.MessageContent,
        ],
    });
    client.addCommand(pingCommand);
    return client;
}
