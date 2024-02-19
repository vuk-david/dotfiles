;;; emoji-display-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "emoji-display" "emoji-display.el" (0 0 0 0))
;;; Generated autoloads from emoji-display.el

(defvar emoji-display-mode nil "\
Non-nil if Emoji-Display mode is enabled.
See the `emoji-display-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `emoji-display-mode'.")

(custom-autoload 'emoji-display-mode "emoji-display" nil)

(autoload 'emoji-display-mode "emoji-display" "\
Toggle emoji displaying mode.

This is a minor mode.  If called interactively, toggle the
`Emoji-Display mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='emoji-display-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "emoji-display" '("emoji-display-"))

;;;***

;;;### (autoloads nil nil ("emoji-display-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; emoji-display-autoloads.el ends here
