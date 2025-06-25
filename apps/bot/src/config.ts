import { config as dotenvConfig } from "dotenv";

export interface VibeBotConfig {
    token: string,
    clientId: string,
}

dotenvConfig()

const tokenEnv = process.env.DISCORD_BOT_TOKEN;
const clientIdEnv = process.env.DISCORD_CLIENT_ID;

if (tokenEnv == undefined || tokenEnv.trim().length == 0) {
    console.error("DISCORD_BOT_TOKEN environment variable not set, check your .env file");
    process.exit(1);
}

if (clientIdEnv == undefined || clientIdEnv.trim().length == 0) {
    console.error("DISCORD_CLIENT_ID environment variable not set, check your .env file");
    process.exit(1);
}

export const config: VibeBotConfig = {
    token: tokenEnv,
    clientId: clientIdEnv
}

