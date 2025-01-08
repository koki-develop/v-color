module color

import strconv

pub struct Rgb {
	r u8
	g u8
	b u8
}

pub fn rgb(r u8, g u8, b u8) Rgb {
	return Rgb{
		r: r
		g: g
		b: b
	}
}

fn Rgb.from(hex string) !Rgb {
	runes := hex.trim_left('#').runes()
	if runes.len != 6 {
		return error('invalid hex color: ${hex}')
	}

	r := strconv.parse_uint(runes[0..2].string(), 16, 8) or {
		return error('invalid hex color: ${hex}')
	}
	g := strconv.parse_uint(runes[2..4].string(), 16, 8) or {
		return error('invalid hex color: ${hex}')
	}
	b := strconv.parse_uint(runes[4..6].string(), 16, 8) or {
		return error('invalid hex color: ${hex}')
	}

	return Rgb{
		r: u8(r)
		g: u8(g)
		b: u8(b)
	}
}

fn (c Rgb) foreground() string {
	return '\x1b[38;2;${c.r};${c.g};${c.b}m'
}

fn (c Rgb) background() string {
	return '\x1b[48;2;${c.r};${c.g};${c.b}m'
}
