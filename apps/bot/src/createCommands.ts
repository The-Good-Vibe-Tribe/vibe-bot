// Script used to add slash commands to the servers, this does not need to run on every start so use `make migrate-discord`

import { clientBuilder } from "./client.js";
import { config } from "./config.js";
import { REST, Routes, RESTGetAPICurrentUserGuildsResult } from 'discord.js';

const rest = new REST().setToken(config.token);
const client = clientBuilder();

(async () => {
    try {
        const deployedCommands = Array.from(client.commands.values()).map((cmd) =>
            cmd.command.toJSON(),
        );
        console.log(
            `Started refreshing ${deployedCommands.length} application (/) commands.`,
        );

        const guilds = await rest.get(
            Routes.userGuilds()
        ) as RESTGetAPICurrentUserGuildsResult;

        for (let guild of guilds) {
            console.log(`Configuring commands for ${guild.name}`);
            await rest.put(
                Routes.applicationGuildCommands(config.clientId, guild.id),
                { body: deployedCommands },
            );
        }
    } catch (error) {
        console.error(error);
    }
})();
