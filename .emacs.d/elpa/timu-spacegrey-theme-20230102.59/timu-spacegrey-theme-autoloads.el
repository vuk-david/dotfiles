;;; timu-spacegrey-theme-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "timu-spacegrey-theme" "timu-spacegrey-theme.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from timu-spacegrey-theme.el

(autoload 'timu-spacegrey-toggle-dark-light "timu-spacegrey-theme" "\
Toggle between \"dark\" and \"light\" `timu-spacegrey-flavour'." t nil)

(autoload 'timu-spacegrey-toggle-org-colors-intensity "timu-spacegrey-theme" "\
Toggle between intense and non intense colors for `org-mode'.
Customize `timu-spacegrey-org-intense-colors' the to achieve this. " t nil)

(autoload 'timu-spacegrey-toggle-mode-line-border "timu-spacegrey-theme" "\
Toggle between borders and no borders for the `mode-line'.
Customize `timu-spacegrey-mode-line-border' the to achieve this. " t nil)

(when load-file-name (add-to-list 'custom-theme-load-path (file-name-as-directory (file-name-directory load-file-name))))

(register-definition-prefixes "timu-spacegrey-theme" '("timu-spacegrey"))

;;;***

;;;### (autoloads nil nil ("timu-spacegrey-theme-pkg.el") (0 0 0
;;;;;;  0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; timu-spacegrey-theme-autoloads.el ends here
