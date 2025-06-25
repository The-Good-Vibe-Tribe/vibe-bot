import { build } from "esbuild";

await build({
    entryPoints: ["src/index.ts"],
    bundle: true,
    platform: "node",
    outfile: "dist/index.js",
    external: ["discord.js"],
});
