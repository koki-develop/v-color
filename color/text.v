module color

pub fn new(text string) Text {
	return Text{
		prefix: ''
		text:   text
	}
}

fn (t Text) append_prefix(prefix string) Text {
	return Text{
		prefix: '${t.prefix}${prefix}'
		text:   t.text
	}
}

@[noinit]
pub struct Text {
	text string
	prefix string
}

pub fn (t Text) str() string {
	return '${t.prefix}${t.text}\x1b[0m'
}

pub type Color = string | AnsiColor | Rgb

pub fn (t Text) foreground(c Color) Text {
	match c {
		AnsiColor {
			if fg := c.foreground() {
				return t.append_prefix(fg)
			}
		}
		Rgb {
			return t.append_prefix(c.foreground())
		}
		string {
			if ansi := AnsiColor.from(c) {
				if fg := ansi.foreground() {
					return t.append_prefix(fg)
				}
			}
			if rgb := Rgb.from(c) {
				return t.append_prefix(rgb.foreground())
			}
		}
	}

	return t
}

pub fn (t Text) background(c Color) Text {
	match c {
		AnsiColor {
			if bg := c.background() {
				return t.append_prefix(bg)
			}
		}
		Rgb {
			return t.append_prefix(c.background())
		}
		string {
			if ansi := AnsiColor.from(c) {
				if bg := ansi.background() {
					return t.append_prefix(bg)
				}
			}
			if rgb := Rgb.from(c) {
				return t.append_prefix(rgb.background())
			}
		}
	}

	return t
}

pub fn (t Text) bold() Text {
	return t.append_prefix('\x1b[1m')
}

pub fn (t Text) dim() Text {
	return t.append_prefix('\x1b[2m')
}

pub fn (t Text) italic() Text {
	return t.append_prefix('\x1b[3m')
}

pub fn (t Text) underline() Text {
	return t.append_prefix('\x1b[4m')
}

pub fn (t Text) blink() Text {
	return t.append_prefix('\x1b[5m')
}

pub fn (t Text) rapid_blink() Text {
	return t.append_prefix('\x1b[6m')
}

pub fn (t Text) reverse() Text {
	return t.append_prefix('\x1b[7m')
}

pub fn (t Text) hidden() Text {
	return t.append_prefix('\x1b[8m')
}

pub fn (t Text) strikethrough() Text {
	return t.append_prefix('\x1b[9m')
}
