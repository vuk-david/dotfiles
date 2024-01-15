# This file is part of ranger, the console file manager.
# License: GNU GPL version 3, see the file "AUTHORS" for details.

from __future__ import (absolute_import, division, print_function)

from ranger.colorschemes.default import Default
from ranger.gui.color import green, red, blue, bold

class Scheme(Default):
    # progress_bar_color = 0x18
    # progress_bar_color = 0x82
    # progress_bar_color = 202
    # progress_bar_color = 0x51
    # progress_bar_color = 0x87

    # progress_bar_color = teal
    # rogress_bar_color = darkred

    # progress_bar_color = 201
    progress_bar_color = 0x5f
    # progress_bar_color = 0x75
    # progress_bar_color = 0x49
    # progress_bar_color = 129

    def use(self, context):
        fg, bg, attr = Default.use(self, context)

        if context.directory and not context.marked and not context.link \
                and not context.inactive_pane:
            fg = self.progress_bar_color

        if context.line_number and not context.selected:
            fg = self.progress_bar_color
            attr &= ~bold

        if context.in_titlebar and context.hostname:
            fg = red if context.bad else green

        return fg, bg, attr
