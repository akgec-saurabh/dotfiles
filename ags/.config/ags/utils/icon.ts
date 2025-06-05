export function getIconName(className: string, title: string) {
    const iconMappings = [
        { match: (c: string, t: string) => c.includes("Spotify"), icon: "spotify" },
        { match: (c: string, t: string) => t.includes("Obsidian"), icon: "obsidian" },
        { match: (c: string, t: string) => c.includes("google-chrome"), icon: "google-chrome" },
        { match: (c: string, t: string) => c.includes("Firefox"), icon: "firefox" },
        { match: (c: string, t: string) => c.includes("Cursor"), icon: "code" },
    ];


    const match = iconMappings.find(m => m.match(className, title));
    return match ? match.icon : className;
}