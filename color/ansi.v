module color

pub type AnsiColor = string

pub const black = AnsiColor('black')
pub const red = AnsiColor('red')
pub const green = AnsiColor('green')
pub const yellow = AnsiColor('yellow')
pub const blue = AnsiColor('blue')
pub const magenta = AnsiColor('magenta')
pub const cyan = AnsiColor('cyan')
pub const white = AnsiColor('white')

pub const high_black = AnsiColor('high_black')
pub const high_red = AnsiColor('high_red')
pub const high_green = AnsiColor('high_green')
pub const high_yellow = AnsiColor('high_yellow')
pub const high_blue = AnsiColor('high_blue')
pub const high_magenta = AnsiColor('high_magenta')
pub const high_cyan = AnsiColor('high_cyan')
pub const high_white = AnsiColor('high_white')

fn AnsiColor.from(s string) !AnsiColor {
	return match s {
		black, red, green, yellow, blue, magenta, cyan, white, high_black, high_red, high_green,
		high_yellow, high_blue, high_magenta, high_cyan, high_white {
			s
		}
		else {
			error('invalid ansi color: ${s}')
		}
	}
}

const ansi_color_foreground = {
	black:        '\x1b[30m'
	red:          '\x1b[31m'
	green:        '\x1b[32m'
	yellow:       '\x1b[33m'
	blue:         '\x1b[34m'
	magenta:      '\x1b[35m'
	cyan:         '\x1b[36m'
	white:        '\x1b[37m'
	high_black:   '\x1b[90m'
	high_red:     '\x1b[91m'
	high_green:   '\x1b[92m'
	high_yellow:  '\x1b[93m'
	high_blue:    '\x1b[94m'
	high_magenta: '\x1b[95m'
	high_cyan:    '\x1b[96m'
	high_white:   '\x1b[97m'
}

const ansi_color_background = {
	black:        '\x1b[40m'
	red:          '\x1b[41m'
	green:        '\x1b[42m'
	yellow:       '\x1b[43m'
	blue:         '\x1b[44m'
	magenta:      '\x1b[45m'
	cyan:         '\x1b[46m'
	white:        '\x1b[47m'
	high_black:   '\x1b[100m'
	high_red:     '\x1b[101m'
	high_green:   '\x1b[102m'
	high_yellow:  '\x1b[103m'
	high_blue:    '\x1b[104m'
	high_magenta: '\x1b[105m'
	high_cyan:    '\x1b[106m'
	high_white:   '\x1b[107m'
}

fn (c AnsiColor) foreground() ?string {
	return ansi_color_foreground[c]
}

fn (c AnsiColor) background() ?string {
	return ansi_color_background[c]
}
