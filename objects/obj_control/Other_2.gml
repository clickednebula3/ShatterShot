// > Colors

//name
//title
//color[s]

//is_for_player
//is_for_mons
//is_for_obstacle
//is_for_laser

//gains_xp



//also uses colors: xp, bullets, portals

enum CO {
	RED_ = 0, YELLOW_ = 1,
	ORANGE_ = 2, AQUA_ = 3,
	GREEN_ = 4, PURPLE_ = 5,
	BLUE_ = 6, WHITE_ = 7,
	TEAMWORK_ = 8, PORTALS_ = 9, MINECRAFT = 10,
}

global.COLO = [
	{
		co: 0,
		color: c_red,
		title: "Decide",
		phrase: "Stay Determined!",
		fun_combo: "get decided imo",
		is_for_player: true,
		is_for_mon: true,
		is_for_obst: true,
		is_for_laser: true,
	},
	{
		co: 1,
		color: c_yellow,
		title: "Shoot",
		phrase: "Serve Justice",
		fun_combo: "pew pew",
		is_for_player: true,
		is_for_mon: true,
		is_for_obst: false,
		is_for_laser: true,//pew pew type
	},
	{
		co: 2,
		color: c_orange,
		title: "Bash",
		phrase: "Bravery",
		fun_combo: "Skull Bash!",
		is_for_player: true,
		is_for_mon: true,
		is_for_obst: true,
		is_for_laser: true,
	},
	{
		co: 3,
		color: c_aqua,
		title: "Parry",
		phrase: "Patience",
		fun_combo: "brain freeze",
		is_for_player: true,
		is_for_mon: true,
		is_for_obst: true,
		is_for_laser: true,
	},
	{
		co: 4,
		color: c_green,
		title: "Shield (Verb)",
		phrase: "Slay em with Kindness",
		fun_combo: "the caps lock",
		is_for_player: true,
		is_for_mon: true,
		is_for_obst: true,
		is_for_laser: false,
	},
	{
		co: 5,
		color: c_purple,
		title: "Thread",
		phrase: "Perseverence",
		fun_combo: "welcome to the internet\nhow was the fall",
		is_for_player: true,
		is_for_mon: true,
		is_for_obst: false,
		is_for_laser: true,
	},
	{
		co: 6,
		color: c_blue,
		title: "Drop",
		phrase: "Integrity",
		fun_combo: "dudu du du",
		is_for_player: true,
		is_for_mon: true,
		is_for_obst: true,
		is_for_laser: false,
	},
	{
		co: 7,
		color: c_white,
		title: "Gravitate",
		phrase: "Hope",
		fun_combo: "Fate",
		is_for_player: true,
		is_for_mon: true,
		is_for_obst: false,
		is_for_laser: true,
	},
	
	
	{
		co: 8,
		color: [c_aqua, c_red],
		title: "Teamwork",
		phrase: "Except you juggle both",
		fun_combo: ":glitter: Dreamwork :glitter:",
		is_for_player: true,
		is_for_mon: false,
		is_for_obst: false,
		is_for_laser: false,
		//the mode itself:
		//
	},
	{
		co: 9,
		color: [c_orange, c_aqua],
		title: "Portal",
		phrase: "Now you're thinking with portals",
		fun_combo: "speedy thing in,\nspeedy thing out",
		is_for_player: true,//controls portals
		is_for_mon: false,
		is_for_obst: false,
		is_for_laser: false,
		//the mode itself:
		//there will be a moving circle that spawns gel, press the button to change its type
		//turrets spawn too
	},
	{
		co: 10,
		color: [c_lime, make_color_rgb(115, 72, 20)],
		title: "Minecraft",
		phrase: "I yearned for the mines",
		fun_combo: "aw man",
		is_for_player: true,
		is_for_mon: false,
		is_for_obst: false,//building block?
		is_for_laser: false,
		//the mode itself:
		//
	},
	{
		co: 11,
		color: [c_lime, c_red],
		title: "Sborb",
		phrase: "Time travel by brain hurting juice",
		fun_combo: "sweet catch",
		is_for_player: true,//
		is_for_mon: false,
		is_for_obst: false,
		is_for_laser: false,
		//the mode itself:
		//
	},
]