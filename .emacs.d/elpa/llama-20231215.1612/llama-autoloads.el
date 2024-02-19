;;; llama-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "llama" "llama.el" (0 0 0 0))
;;; Generated autoloads from llama.el

(autoload '## "llama" "\
Expand to a `lambda' expression that wraps around FN and ARGS.

This `lambda' expression calls the function FN with arguments
ARGS and returns its value.  Its own arguments are derived from
symbols found in ARGS.

Each symbol from `%1' through `%9', which appears in ARGS,
specifies an argument.  Each symbol from `&1' through `&9', which
appears in ARGS, specifies an optional argument.  All arguments
following an optional argument have to be optional as well, thus
their names have to begin with `&'.  Symbol `&*' specifies extra
\(`&rest') arguments.

Instead of `%1', the shorthand `%' can be used; but that should
only be done if it is the only argument, and using both `%1' and
`%' is not allowed.  Likewise `&' can be substituted for `&1'.

Instead of:

  (lambda (a _ &optional c &rest d)
    (foo a (bar c) d))

you can use this macro and write:

  (##foo %1 (bar &3) &*)

which expands to:

  (lambda (%1 _%2 &optional &3 &rest &*)
    (foo %1 (bar &3) &*))

The name `##' was chosen because that allows (optionally)
omitting the whitespace between it and the following symbol.
It also looks a bit like #\\='function.

\(fn FN &rest ARGS)" nil t)

(autoload 'llama-fontify-mode "llama" "\
Toggle fontification of the `##' macro and its positional arguments.

This is a minor mode.  If called interactively, toggle the
`Llama-Fontify mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `llama-fontify-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(put 'global-llama-fontify-mode 'globalized-minor-mode t)

(defvar global-llama-fontify-mode nil "\
Non-nil if Global Llama-Fontify mode is enabled.
See the `global-llama-fontify-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-llama-fontify-mode'.")

(custom-autoload 'global-llama-fontify-mode "llama" nil)

(autoload 'global-llama-fontify-mode "llama" "\
Toggle Llama-Fontify mode in all buffers.
With prefix ARG, enable Global Llama-Fontify mode if ARG is positive;
otherwise, disable it.

If called from Lisp, toggle the mode if ARG is `toggle'.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Llama-Fontify mode is enabled in all buffers where
`llama--turn-on-fontify-mode' would do it.

See `llama-fontify-mode' for more information on Llama-Fontify mode.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "llama" '("llama-"))

;;;***

;;;### (autoloads nil nil ("llama-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; llama-autoloads.el ends here
